// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_evaluation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterviewEvaluationModel _$InterviewEvaluationModelFromJson(
        Map<String, dynamic> json) =>
    InterviewEvaluationModel(
      id: json['id'] as String,
      interviewId: json['interview_id'] as String,
      overallScore: (json['overall_score'] as num).toInt(),
      overallFeedback: json['overall_feedback'] as String,
      strengths:
          (json['strengths'] as List<dynamic>).map((e) => e as String).toList(),
      weaknesses: (json['weaknesses'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      recommendations: (json['recommendations'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      technicalScores: TechnicalScoresModel.fromJson(
          json['technical_scores'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InterviewEvaluationModelToJson(
        InterviewEvaluationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'interview_id': instance.interviewId,
      'overall_score': instance.overallScore,
      'overall_feedback': instance.overallFeedback,
      'strengths': instance.strengths,
      'weaknesses': instance.weaknesses,
      'recommendations': instance.recommendations,
      'technical_scores': instance.technicalScores,
      'created_at': instance.createdAt.toIso8601String(),
    };
