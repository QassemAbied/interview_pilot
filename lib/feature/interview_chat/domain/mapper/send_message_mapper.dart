import '../../data/models/send_message_model.dart';
import '../../domain/entities/send_message_entity.dart';

class SendMessageMapper {
  static SendMessageModel toModel(SendMessageEntity entity) {
    return SendMessageModel(
      interviewId: entity.interviewId,
      sender: entity.sender.name,
      message: entity.message,
    );
  }
}
