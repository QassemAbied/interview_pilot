// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_interview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateInterviewModel _$CreateInterviewModelFromJson(
        Map<String, dynamic> json) =>
    CreateInterviewModel(
      userId: json['user_id'] as String,
      jobTitle: json['job_title'] as String,
      companyName: json['company_name'] as String?,
      jobDescription: json['job_description'] as String?,
      interviewType: json['interview_type'] as String,
      level: json['level'] as String,
      score: (json['score'] as num).toInt(),
      duration: (json['duration'] as num).toInt(),
      status: json['status'] as String,
      startedAt: DateTime.parse(json['started_at'] as String),
    );

Map<String, dynamic> _$CreateInterviewModelToJson(
        CreateInterviewModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'job_title': instance.jobTitle,
      'company_name': instance.companyName,
      'job_description': instance.jobDescription,
      'interview_type': instance.interviewType,
      'level': instance.level,
      'score': instance.score,
      'duration': instance.duration,
      'status': instance.status,
      'started_at': instance.startedAt.toIso8601String(),
    };
