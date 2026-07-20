import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  final String id;

  @JsonKey(name: 'interview_id')
  final String interviewId;

  final String sender;

  final String message;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  const MessageModel({
    required this.id,
    required this.interviewId,
    required this.sender,
    required this.message,
    required this.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MessageModelToJson(this);
}