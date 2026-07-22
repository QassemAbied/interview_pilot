import 'package:interview_pilot/feature/interview_result/domain/entities/technical_scores_entity.dart';

class InterviewEvaluationEntity {
  final String id;

  final String interviewId;

  final int overallScore;

  final String overallFeedback;
  final TechnicalScoresEntity technicalScores;
  final List<String> strengths;

  final List<String> weaknesses;

  final List<String> recommendations;

  final DateTime createdAt;

  const InterviewEvaluationEntity({
    required this.id,
    required this.interviewId,
    required this.overallScore,
    required this.overallFeedback,
    required this.strengths,
    required this.weaknesses,
    required this.recommendations,
    required this.createdAt,
    required this.technicalScores,
  });


  static final dummy = InterviewEvaluationEntity(
    id: 'dummy-evaluation-id',
    interviewId: 'dummy-interview-id',
    overallScore: 85,
    overallFeedback:
    'You demonstrated strong technical knowledge and communication skills.',
    strengths: const [
      'Strong Flutter knowledge',
      'Good problem solving',
    ],
    weaknesses: const [
      'Architecture needs improvement',
    ],
    recommendations: const [
      'Practice advanced architecture patterns',
    ],
    technicalScores: TechnicalScoresEntity.dummy,
    createdAt: DateTime.now(),
  );
}
