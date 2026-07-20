import '../../../interview/domain/entities/interview_entity.dart';

class DashboardEntity {

  final int totalInterviews;

  final double averageScore;

  final double bestScore;

  final double successRate;

  final List<InterviewEntity> recentInterviews;

  const DashboardEntity({
    required this.totalInterviews,
    required this.averageScore,
    required this.bestScore,
    required this.successRate,
    required this.recentInterviews,
  });
}

