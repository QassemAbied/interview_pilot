import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../feature/ai/data/models/ai_request_model.dart';
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
}
