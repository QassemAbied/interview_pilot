// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technical_scores_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TechnicalScoresModel _$TechnicalScoresModelFromJson(
        Map<String, dynamic> json) =>
    TechnicalScoresModel(
      flutter: (json['flutter'] as num).toInt(),
      architecture: (json['architecture'] as num).toInt(),
      problemSolving: (json['problem_solving'] as num).toInt(),
      communication: (json['communication'] as num).toInt(),
      confidence: (json['confidence'] as num).toInt(),
    );

Map<String, dynamic> _$TechnicalScoresModelToJson(
        TechnicalScoresModel instance) =>
    <String, dynamic>{
      'flutter': instance.flutter,
      'architecture': instance.architecture,
      'problem_solving': instance.problemSolving,
      'communication': instance.communication,
      'confidence': instance.confidence,
    };
