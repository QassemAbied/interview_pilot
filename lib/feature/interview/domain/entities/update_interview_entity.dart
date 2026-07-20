import '../../../../core/utils/enum/interview_enum.dart';

class UpdateInterviewEntity {
  final String id;

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

  const UpdateInterviewEntity({
    required this.id,
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
  });
}
