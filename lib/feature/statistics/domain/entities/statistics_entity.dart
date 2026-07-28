import 'package:interview_pilot/feature/statistics/domain/entities/skill_performance_entity.dart';

import '../../../interview_result/domain/entities/technical_scores_entity.dart';
import 'performance_point_entity.dart';

class StatisticsEntity {
  final int totalInterviews;
  final int averageScore;
  final int bestScore;

  /// Percentage change compared with previous performance.
  final double progressPercentage;

  /// Average score for each technical skill across all interviews.
  final TechnicalScoresEntity averageTechnicalScores;

  /// Scores ordered chronologically for the performance chart.
  final List<PerformancePointEntity> performanceHistory;
  final SkillPerformanceEntity strongestSkill;
  final SkillPerformanceEntity focusArea;
  const StatisticsEntity({
    required this.totalInterviews,
    required this.averageScore,
    required this.bestScore,
    required this.progressPercentage,
    required this.averageTechnicalScores,
    required this.performanceHistory,
    required this.strongestSkill, required this.focusArea,
  });

  static final dummy = StatisticsEntity(
    totalInterviews: 2,
    averageScore: 50,
    bestScore: 70,
    progressPercentage:463,
    averageTechnicalScores: const TechnicalScoresEntity(
      flutter: 0,
      architecture: 0,
      problemSolving: 0,
      communication: 0,
      confidence: 0,
    ),
    performanceHistory: [
      PerformancePointEntity(score: 68, date: DateTime(2026, 6, 2)),
      PerformancePointEntity(score: 74, date: DateTime(2026, 6, 8)),
      PerformancePointEntity(score: 79, date: DateTime(2026, 6, 15)),
      PerformancePointEntity(score: 84, date: DateTime(2026, 6, 22)),
      PerformancePointEntity(score: 88, date: DateTime(2026, 6, 29)),
    ],
    strongestSkill: SkillPerformanceEntity.dummy,
    focusArea: SkillPerformanceEntity.dummy,
  );
}
