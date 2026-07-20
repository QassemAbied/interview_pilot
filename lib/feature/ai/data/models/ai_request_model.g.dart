// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiRequestModel _$AiRequestModelFromJson(Map<String, dynamic> json) =>
    AiRequestModel(
      systemPrompt: json['system_prompt'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => AiMessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      temperature: (json['temperature'] as num).toDouble(),
      maxTokens: (json['max_tokens'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AiRequestModelToJson(AiRequestModel instance) =>
    <String, dynamic>{
      'system_prompt': instance.systemPrompt,
      'messages': instance.messages.map((e) => e.toJson()).toList(),
      'temperature': instance.temperature,
      'max_tokens': instance.maxTokens,
    };
