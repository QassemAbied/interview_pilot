class ResumeAnalysisEntity {
  final String id;

  final String resumeFileName;
  final String resumeFilePath;

  final String targetJob;
  final String? jobDescription;

  final int overallScore;
  final int atsScore;
  final int? jobMatchScore;

  final String summary;

  final List<String> strengths;
  final List<String> weaknesses;
  final List<String> missingKeywords;
  final List<String> recommendations;

  final DateTime createdAt;

  const ResumeAnalysisEntity({
    required this.id,
    required this.resumeFileName,
    required this.resumeFilePath,
    required this.targetJob,
    this.jobDescription,
    required this.overallScore,
    required this.atsScore,
    this.jobMatchScore,
    required this.summary,
    required this.strengths,
    required this.weaknesses,
    required this.missingKeywords,
    required this.recommendations,
    required this.createdAt,
  });
}
