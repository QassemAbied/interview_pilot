import 'package:interview_pilot/feature/resumes/domain/entities/resume_file_entity.dart';

class AnalyzeResumeParams {
  final ResumeFileEntity resume;
  final String targetJob;
  final String? jobDescription;

  const AnalyzeResumeParams({
    required this.resume,
    required this.targetJob,
    this.jobDescription,
  });
}
