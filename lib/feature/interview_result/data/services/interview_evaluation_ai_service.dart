import 'dart:convert';

import '../../../../core/services/ai_service/groq_service.dart';
import '../../../ai/data/models/ai_request_model.dart';
import '../../../interview_chat/data/models/message_model.dart';
import '../models/interview_evaluation_model.dart';
import '../models/technical_scores_model.dart';
import 'interview_evaluation_prompt.dart';

class InterviewEvaluationAiService {
  final GroqService groqService;

  InterviewEvaluationAiService({required this.groqService});

  Future<InterviewEvaluationModel> generateEvaluation({
    required String interviewId,
    required List<MessageModel> messages,
  }) async {
    final prompt = InterviewEvaluationPrompt.build(messages);

    final response = await groqService.askAi(
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
      technicalScores: TechnicalScoresModel.fromJson(json['technical_scores']),
      recommendations: List<String>.from(json['recommendations'] ?? []),
      createdAt: DateTime.now(),
    );
  }
}
