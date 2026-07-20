import 'ai_message_entity.dart';

class AiRequestEntity {
  final String systemPrompt;

  final List<AiMessageEntity> messages;

  final double temperature;

  final int? maxTokens;

  const AiRequestEntity({
    required this.systemPrompt,
    required this.messages,
    this.temperature = .7,
    this.maxTokens,
  });
}
