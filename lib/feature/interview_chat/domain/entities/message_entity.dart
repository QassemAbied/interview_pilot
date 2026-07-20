import '../../../../core/utils/enum/interview_enum.dart';

class MessageEntity {
  final String id;

  final String interviewId;

  final MessageSender sender;

  final String message;

  final DateTime createdAt;

  const MessageEntity({
    required this.id,
    required this.interviewId,
    required this.sender,
    required this.message,
    required this.createdAt,
  });

  bool get isUser => sender == MessageSender.user;

  bool get isAI => sender == MessageSender.ai;

  MessageEntity copyWith({
    String? id,
    String? interviewId,
    MessageSender? sender,
    String? message,
    DateTime? createdAt,
  }) {
    return MessageEntity(
      id: id ?? this.id,
      interviewId: interviewId ?? this.interviewId,
      sender: sender ?? this.sender,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}