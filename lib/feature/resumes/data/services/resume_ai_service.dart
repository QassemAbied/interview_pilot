import 'dart:convert';
import 'package:interview_pilot/feature/resumes/data/services/resume_analysis_prompt.dart';
import '../../../../core/services/ai_service/groq_service.dart';
import '../../../ai/data/models/ai_request_model.dart';
import '../models/resume_analysis_model.dart';

class ResumeAiService {
  final GroqService groqService;

  ResumeAiService({required this.groqService});

  Future<ResumeAnalysisModel> generateAnalysis({
    required String resumeText,
    required String resumeFileName,
    required String resumeFilePath,
    required String targetJob,
    String? jobDescription,
  }) async {
    final prompt = ResumeAnalysisPrompt.build(
      resumeText: resumeText,
      targetJob: targetJob,
      jobDescription: jobDescription,
    );

    final response = await groqService.askAi(
      AiRequestModel(
        systemPrompt: prompt,
        messages: const [],
        temperature: 0.2,
      ),
    );

    final json = jsonDecode(response) as Map<String, dynamic>;

    return ResumeAnalysisModel(
      id: '',
      resumeFileName: resumeFileName,
      resumeFilePath: resumeFilePath,
      targetJob: targetJob,
      jobDescription: jobDescription,
      overallScore: (json['overall_score'] as num).toInt(),
      atsScore: (json['ats_score'] as num).toInt(),
      jobMatchScore: (json['job_match_score'] as num?)?.toInt(),
      summary: json['summary'] as String,
      strengths: List<String>.from(json['strengths'] ?? []),
      weaknesses: List<String>.from(json['weaknesses'] ?? []),
      missingKeywords: List<String>.from(json['missing_keywords'] ?? []),
      recommendations: List<String>.from(json['recommendations'] ?? []),
      createdAt: DateTime.now(),
    );
  }
}
