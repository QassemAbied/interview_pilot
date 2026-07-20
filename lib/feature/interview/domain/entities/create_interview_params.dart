class CreateInterviewParams {
  final String jobTitle;

  final String? companyName;

  final String? jobDescription;

  final String interviewType;

  final String level;

  const CreateInterviewParams({
    required this.jobTitle,
    this.companyName,
    this.jobDescription,
    required this.interviewType,
    required this.level,
  });
}
