// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_analysis_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResumeAnalysisModel _$ResumeAnalysisModelFromJson(Map<String, dynamic> json) =>
    ResumeAnalysisModel(
      id: json['id'] as String,
      resumeFileName: json['resume_file_name'] as String,
      resumeFilePath: json['resume_file_path'] as String,
      targetJob: json['target_job'] as String,
      jobDescription: json['job_description'] as String?,
      overallScore: (json['overall_score'] as num).toInt(),
      atsScore: (json['ats_score'] as num).toInt(),
      jobMatchScore: (json['job_match_score'] as num?)?.toInt(),
      summary: json['summary'] as String,
      strengths:
          (json['strengths'] as List<dynamic>).map((e) => e as String).toList(),
      weaknesses: (json['weaknesses'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      missingKeywords: (json['missing_keywords'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      recommendations: (json['recommendations'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ResumeAnalysisModelToJson(
        ResumeAnalysisModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'resume_file_name': instance.resumeFileName,
      'resume_file_path': instance.resumeFilePath,
      'target_job': instance.targetJob,
      'job_description': instance.jobDescription,
      'overall_score': instance.overallScore,
      'ats_score': instance.atsScore,
      'job_match_score': instance.jobMatchScore,
      'summary': instance.summary,
      'strengths': instance.strengths,
      'weaknesses': instance.weaknesses,
      'missing_keywords': instance.missingKeywords,
      'recommendations': instance.recommendations,
      'created_at': instance.createdAt.toIso8601String(),
    };
