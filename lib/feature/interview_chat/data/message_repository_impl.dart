import 'package:dartz/dartz.dart';
import 'package:interview_pilot/feature/interview_chat/data/data_source/message_remote_data_source.dart';

import '../../../../core/helpers/base_repository.dart';
import '../../../core/error/Failure.dart';
import '../domain/entities/message_entity.dart';
import '../domain/entities/send_message_entity.dart';
import '../domain/mapper/message_mapper.dart';
import '../domain/mapper/send_message_mapper.dart';
import '../domain/message_repository.dart';

class MessageRepositoryImpl extends BaseRepository
    implements MessageRepository {
  final MessageRemoteDataSource remoteDataSource;

  MessageRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Unit>> sendMessage(SendMessageEntity message) async {
    return execute(() async {
      await remoteDataSource.sendMessage(SendMessageMapper.toModel(message));

      return unit;
    });
  }

  @override
  Stream<Either<Failure, List<MessageEntity>>> watchMessages(
    String interviewId,
  ) {
    return remoteDataSource
        .watchMessages(interviewId)
        .map((messages) => right(MessageMapper.toListEntity(messages)));
  }

  @override
  Future<Either<Failure, List<MessageEntity>>> getMessages(String interviewId) {
    return execute(() async {
      final messages = await remoteDataSource.getMessages(interviewId);

      return MessageMapper.toListEntity(messages);
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteMessages(String interviewId) async {
    return await execute(() async {
      await remoteDataSource.deleteMessages(interviewId);
      return unit;
    });
  }
}
