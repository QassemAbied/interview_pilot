import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../feature/ai/data/models/ai_request_model.dart';
import '../../../feature/interview_chat/data/models/message_model.dart';
import '../../../feature/interview_result/data/models/interview_evaluation_model.dart';
import '../../../feature/interview_result/data/models/technical_scores_model.dart';
import 'api_key.dart';

class GroqService {
  final Dio dio;

  GroqService({required this.dio});

  Stream<String> askAiStream(AiRequestModel request) async* {
    final body = {
      "model": "llama-3.1-8b-instant",
      "stream": true,
      "messages": [
        {"role": "system", "content": request.systemPrompt},
        ...request.messages.map((e) => e.toJson()),
      ],
      "temperature": request.temperature,
      if (request.maxTokens != null) "max_tokens": request.maxTokens,
    };
    try {
      final response = await dio.post<ResponseBody>(
        "/chat/completions",
        data: body,
        options: Options(
          responseType: ResponseType.stream,
          headers: {
            "Authorization": "Bearer ${ApiKey.groqApiKey}",
            "Content-Type": "application/json",
            "Accept": "text/event-stream",
          },
        ),
      );

      final lines = response.data!.stream
          .map((e) => utf8.decode(e))
          .transform(const LineSplitter());

      await for (final line in lines) {
        if (!line.startsWith("data:")) continue;
        final data = line.substring(5).trim();
        if (data.isEmpty) continue;
        if (data == "[DONE]") {
          break;
        }

        try {
          final json = jsonDecode(data);
          final choices = json["choices"] as List?;
          if (choices == null || choices.isEmpty) {
            continue;
          }

          final delta = choices.first["delta"];
          if (delta == null) {
            continue;
          }
          final content = delta["content"];
          if (content == null) continue;
          if (content.toString().isEmpty) continue;
          yield content.toString();
        } catch (e) {
          throw ("Error parsing JSON: $e");
        }
      }
    } on DioException catch (e) {
      if (e.response?.data is ResponseBody) {
        await utf8.decoder
            .bind((e.response!.data as ResponseBody).stream)
            .join();
      } else {}
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<InterviewEvaluationModel> generateInterviewEvaluation({
    required String interviewId,
    required List<MessageModel> messages,
  })
  async {
    final prompt = _buildEvaluationPrompt(messages);

    final response = await askAi(
      AiRequestModel(
        systemPrompt: prompt,
        messages: const [],
        temperature: 0.2,
      ),
    );

    final Map<String, dynamic> json = jsonDecode(response);

    return InterviewEvaluationModel(
      id: '',
      interviewId: interviewId,
      overallScore: json['overall_score'] as int,
      overallFeedback: json['overall_feedback'] as String,
      strengths: List<String>.from(json['strengths'] ?? []),
      weaknesses: List<String>.from(json['weaknesses'] ?? []),
      technicalScores: TechnicalScoresModel.fromJson(
        json['technical_scores'],
      ),
      recommendations: List<String>.from(
        json['recommendations'] ?? [],
      ),
      createdAt: DateTime.now(),
    );
  }

  String _buildEvaluationPrompt(List<MessageModel> messages) {
    final conversation = messages
        .map((e) => '${e.sender.toUpperCase()}: ${e.message}')
        .join('\n');

    return '''
You are an expert technical interviewer.

Analyze the following interview.

Return ONLY valid JSON.

{
  "overall_score": 0,
  "overall_feedback": "",

  "technical_scores": {
    "flutter": 0,
    "architecture": 0,
    "problem_solving": 0,
    "communication": 0,
    "confidence": 0
  },

  "strengths": [],
  "weaknesses": [],
  "recommendations": []
}
Give realistic scores from 0 to 100.

Do not leave any field empty.

Return ONLY valid JSON without markdown.

Interview:

$conversation
''';
  }

  Future<String> askAi(AiRequestModel request) async {
    final body = {
      "model": "llama-3.1-8b-instant",
      "stream": false,
      "messages": [
        {"role": "system", "content": request.systemPrompt},
        ...request.messages.map((e) => e.toJson()),
      ],
      "temperature": request.temperature,
      if (request.maxTokens != null) "max_tokens": request.maxTokens,
    };

    final response = await dio.post(
      "/chat/completions",
      data: body,
      options: Options(
        headers: {
          "Authorization": "Bearer ${ApiKey.groqApiKey}",
          "Content-Type": "application/json",
        },
      ),
    );

    return response.data["choices"][0]["message"]["content"] as String;
  }
}
