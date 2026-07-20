import 'package:json_annotation/json_annotation.dart';

import 'ai_message_model.dart';

part 'ai_request_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AiRequestModel {
  @JsonKey(name: 'system_prompt')
  final String systemPrompt;

  final List<AiMessageModel> messages;

  final double temperature;

  @JsonKey(name: 'max_tokens')
  final int? maxTokens;

  const AiRequestModel({
    required this.systemPrompt,
    required this.messages,
    required this.temperature,
    this.maxTokens,
  });

  factory AiRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AiRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AiRequestModelToJson(this);
}