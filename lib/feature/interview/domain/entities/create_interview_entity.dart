import '../../../../core/utils/enum/interview_enum.dart';

class CreateInterviewEntity {
  final String jobTitle;

  final String? companyName;

  final String? jobDescription;

  final InterviewType interviewType;

  final ExperienceLevel level;

  const CreateInterviewEntity({
    required this.jobTitle,
    this.companyName,
    this.jobDescription,
    required this.interviewType,
    required this.level,
  });
}
