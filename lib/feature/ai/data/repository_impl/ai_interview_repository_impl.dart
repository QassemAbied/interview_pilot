import 'package:dartz/dartz.dart';
import 'package:interview_pilot/core/error/Failure.dart';

import '../../../../../core/helpers/base_repository.dart';
import '../../../../core/utils/enum/interview_enum.dart';
import '../../../interview/domain/interview_repository.dart';
import '../../../interview_chat/domain/entities/send_message_entity.dart';
import '../../../interview_chat/domain/message_repository.dart';
import '../../domain/entities/ai_message_entity.dart';
import '../../domain/entities/ai_request_entity.dart';
import '../../domain/entities/send_interview_message_params.dart';
import '../../domain/repository/ai_interview_repository.dart';
import '../../domain/repository/ai_repository.dart';
import '../../prompt/interview_prompt.dart';

class AiInterviewRepositoryImpl extends BaseRepository
    implements AiInterviewRepository {
  final MessageRepository messageRepository;
  final InterviewRepository interviewRepository;
  final AiRepository aiRepository;

  AiInterviewRepositoryImpl({
    required this.messageRepository,
    required this.interviewRepository,
    required this.aiRepository,
  });
  @override
  Stream<Either<Failure, String>> sendInterviewMessage(
      SendInterviewMessageParams params,
      ) async* {
    final sendResult = await messageRepository.sendMessage(
      SendMessageEntity(
        interviewId: params.interviewId,
        sender: MessageSender.user,
        message: params.message,
      ),
    );

    if (sendResult.isLeft()) {
      yield left(sendResult.fold((l) => l, (_) => throw UnimplementedError()));
      return;
    }

    final interviewResult = await interviewRepository.getInterview(
      params.interviewId,
    );

    if (interviewResult.isLeft()) {
      yield left(interviewResult.fold((l) => l, (_) => throw UnimplementedError()));
      return;
    }

    final interview = interviewResult.getOrElse(
          () => throw Exception(),
    );

    final messagesResult = await messageRepository.getMessages(
      params.interviewId,
    );

    if (messagesResult.isLeft()) {
      yield left(messagesResult.fold((l) => l, (_) => throw UnimplementedError()));
      return;
    }

    final messages = messagesResult.getOrElse(
          () => [],
    );

    final history = messages
        .where((e) => e.message.trim().isNotEmpty)
        .map(
          (e) => AiMessageEntity(
        role: e.sender == MessageSender.user
            ? "user"
            : "assistant",
        content: e.message.trim(),
      ),
    )
        .toList();

    final request = AiRequestEntity(
      systemPrompt: InterviewPrompt.build(interview),
      messages: history.length > 12
          ? history.sublist(history.length - 12)
          : history,
    );

    final buffer = StringBuffer();

    await for (final result in aiRepository.askAiStream(request)) {
      yield result.map((chunk) {
        buffer.write(chunk);
        return buffer.toString();
      });
    }

    if (buffer.isNotEmpty) {
      await messageRepository.sendMessage(
        SendMessageEntity(
          interviewId: params.interviewId,
          sender: MessageSender.ai,
          message: buffer.toString(),
        ),
      );
    }
  }
}
