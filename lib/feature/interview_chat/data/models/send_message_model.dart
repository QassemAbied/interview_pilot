import 'package:json_annotation/json_annotation.dart';

part 'send_message_model.g.dart';

@JsonSerializable()
class SendMessageModel {
  @JsonKey(name: 'interview_id')
  final String interviewId;

  final String sender;

  final String message;

  const SendMessageModel({
    required this.interviewId,
    required this.sender,
    required this.message,
  });

  factory SendMessageModel.fromJson(Map<String, dynamic> json) =>
      _$SendMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendMessageModelToJson(this);
}