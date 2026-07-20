// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiMessageModel _$AiMessageModelFromJson(Map<String, dynamic> json) =>
    AiMessageModel(
      role: json['role'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$AiMessageModelToJson(AiMessageModel instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };
