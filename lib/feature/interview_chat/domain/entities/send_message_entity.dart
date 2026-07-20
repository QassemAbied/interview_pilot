import '../../../../core/utils/enum/interview_enum.dart';

class SendMessageEntity {
  final String interviewId;

  final MessageSender sender;

  final String message;

  const SendMessageEntity({
    required this.interviewId,
    required this.sender,
    required this.message,
  });
}