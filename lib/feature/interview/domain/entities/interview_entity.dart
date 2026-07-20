import '../../../../core/utils/enum/interview_enum.dart';

class InterviewEntity {
  final String id;

  final String userId;

  final String jobTitle;

  final String? companyName;

  final String? jobDescription;

  final InterviewType interviewType;

  final ExperienceLevel level;

  final int score;

  final int duration;

  final InterviewStatus status;

  final DateTime? startedAt;

  final DateTime? endedAt;

  final DateTime createdAt;

  final DateTime updatedAt;

  const InterviewEntity({
    required this.id,
    required this.userId,
    required this.jobTitle,
    this.companyName,
    this.jobDescription,
    required this.interviewType,
    required this.level,
    required this.score,
    required this.duration,
    required this.status,
    this.startedAt,
    this.endedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isCompleted => status == InterviewStatus.completed;

  bool get isInProgress => status == InterviewStatus.inProgress;

  bool get isCancelled => status == InterviewStatus.cancelled;
}
