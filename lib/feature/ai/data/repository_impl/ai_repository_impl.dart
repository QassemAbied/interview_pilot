import 'package:dartz/dartz.dart';
import 'package:interview_pilot/core/error/Failure.dart';
import 'package:interview_pilot/feature/ai/domain/repository/ai_repository.dart';
import 'package:interview_pilot/feature/ai/domain/entities/ai_request_entity.dart';
import '../../../../core/helpers/base_repository.dart';
import '../../../../core/utils/enum/interview_enum.dart';
import '../../../interview/domain/entities/interview_entity.dart';
import '../../../interview_chat/domain/entities/send_message_entity.dart';
import '../../../interview_chat/domain/message_repository.dart';
import '../../domain/mapper/ai_mapper.dart';
import '../../prompt/interview_prompt.dart';
import '../data_source/ai_remote_data_source.dart';

class AiRepositoryImpl extends BaseRepository implements AiRepository {
  final AiRemoteDataSource remoteDataSource;
  final MessageRepository messageRepository;

  AiRepositoryImpl({
    required this.remoteDataSource,
    required this.messageRepository,
  });
  @override
  Stream<Either<Failure, String>> askAiStream(AiRequestEntity request) async* {
    try {
      await for (final chunk in remoteDataSource.askAiStream(
        AiMapper.toRequestModel(request),
      )) {
        yield right(chunk);
      }
    } catch (e) {
      yield left(ServerFailure(message: e.toString()));
    }
  }
  @override
  Stream<Either<Failure, String>> startInterview(
    InterviewEntity interview,
  ) async* {
    final request = AiRequestEntity(
      systemPrompt:
          """
${InterviewPrompt.build(interview)}

This is the first message of the interview.

Introduce yourself briefly.

Ask ONLY the first interview question.

Do not answer anything else.
""",
      messages: const [],
    );

    final buffer = StringBuffer();
    await for (final result in askAiStream(request)) {
      if (result.isLeft()) {
        yield result;
        return;
      }

      final chunk = result.getOrElse(() => '');

      buffer.write(chunk);
      yield right(chunk);
    }

    final aiMessage = buffer.toString().trim();

    if (aiMessage.isEmpty) {
      yield left(ServerFailure(message: "AI returned empty response"));
      return;
    }

    final saveResult = await messageRepository.sendMessage(
      SendMessageEntity(
        interviewId: interview.id,
        sender: MessageSender.ai,
        message: aiMessage,
      ),
    );

    if (saveResult.isLeft()) {
      yield left(saveResult.fold((l) => l, (_) => throw UnimplementedError()));
    }
  }
}
