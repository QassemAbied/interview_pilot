import '../../../../core/utils/enum/interview_enum.dart';
import '../../data/models/message_model.dart';
import '../../domain/entities/message_entity.dart';

class MessageMapper {
  static MessageEntity toEntity(MessageModel model) {
    return MessageEntity(
      id: model.id,
      interviewId: model.interviewId,
      sender:MessageSender.values.byName(model.sender),
      message: model.message,
      createdAt: model.createdAt,
    );
  }

  static List<MessageEntity> toListEntity(List<MessageModel> models) {
    return models.map(toEntity).toList();
  }

  static MessageModel toModel(MessageEntity entity) {
    return MessageModel(
      id: entity.id,
      interviewId: entity.interviewId,
      sender: entity.sender.name,
      message: entity.message,
      createdAt: entity.createdAt,
    );
  }
}
