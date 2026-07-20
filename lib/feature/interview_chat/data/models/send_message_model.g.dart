// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageModel _$SendMessageModelFromJson(Map<String, dynamic> json) =>
    SendMessageModel(
      interviewId: json['interview_id'] as String,
      sender: json['sender'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$SendMessageModelToJson(SendMessageModel instance) =>
    <String, dynamic>{
      'interview_id': instance.interviewId,
      'sender': instance.sender,
      'message': instance.message,
    };
