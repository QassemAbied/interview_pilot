import 'package:json_annotation/json_annotation.dart';

part 'resume_analysis_model.g.dart';

@JsonSerializable()
class ResumeAnalysisModel {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'resume_file_name')
  final String resumeFileName;

  @JsonKey(name: 'resume_file_path')
  final String resumeFilePath;

  @JsonKey(name: 'target_job')
  final String targetJob;

  @JsonKey(name: 'job_description')
  final String? jobDescription;

  @JsonKey(name: 'overall_score')
  final int overallScore;

  @JsonKey(name: 'ats_score')
  final int atsScore;

  @JsonKey(name: 'job_match_score')
  final int? jobMatchScore;

  @JsonKey(name: 'summary')
  final String summary;

  @JsonKey(name: 'strengths')
  final List<String> strengths;

  @JsonKey(name: 'weaknesses')
  final List<String> weaknesses;

  @JsonKey(name: 'missing_keywords')
  final List<String> missingKeywords;

  @JsonKey(name: 'recommendations')
  final List<String> recommendations;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  const ResumeAnalysisModel({
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

  factory ResumeAnalysisModel.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$ResumeAnalysisModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ResumeAnalysisModelToJson(this);
}