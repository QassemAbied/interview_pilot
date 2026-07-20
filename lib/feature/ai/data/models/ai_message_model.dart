import 'package:json_annotation/json_annotation.dart';

part 'ai_message_model.g.dart';

@JsonSerializable()
class AiMessageModel {
  final String role;

  final String content;

  const AiMessageModel({
    required this.role,
    required this.content,
  });

  factory AiMessageModel.fromJson(Map<String, dynamic> json) =>
      _$AiMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$AiMessageModelToJson(this);
}