// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterviewModel _$InterviewModelFromJson(Map<String, dynamic> json) =>
    InterviewModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      jobTitle: json['job_title'] as String,
      companyName: json['company_name'] as String?,
      jobDescription: json['job_description'] as String?,
      interviewType: json['interview_type'] as String,
      level: json['level'] as String,
      score: (json['score'] as num).toInt(),
      duration: (json['duration'] as num).toInt(),
      status: json['status'] as String,
      startedAt: json['started_at'] == null
          ? null
          : DateTime.parse(json['started_at'] as String),
      endedAt: json['ended_at'] == null
          ? null
          : DateTime.parse(json['ended_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$InterviewModelToJson(InterviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'job_title': instance.jobTitle,
      'company_name': instance.companyName,
      'job_description': instance.jobDescription,
      'interview_type': instance.interviewType,
      'level': instance.level,
      'score': instance.score,
      'duration': instance.duration,
      'status': instance.status,
      'started_at': instance.startedAt?.toIso8601String(),
      'ended_at': instance.endedAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
