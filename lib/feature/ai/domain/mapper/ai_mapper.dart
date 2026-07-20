import '../../data/models/ai_message_model.dart';
import '../../data/models/ai_request_model.dart';
import '../../domain/entities/ai_message_entity.dart';
import '../../domain/entities/ai_request_entity.dart';

class AiMapper {
  const AiMapper._();

  static AiMessageModel toMessageModel(AiMessageEntity entity) {
    return AiMessageModel(role: entity.role, content: entity.content);
  }

  static AiRequestModel toRequestModel(AiRequestEntity entity) {
    return AiRequestModel(
      systemPrompt: entity.systemPrompt,
      messages: entity.messages.map(toMessageModel).toList(),
      temperature: entity.temperature,
      maxTokens: entity.maxTokens,
    );
  }


}
