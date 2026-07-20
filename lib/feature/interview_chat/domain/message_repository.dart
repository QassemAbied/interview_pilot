import 'package:dartz/dartz.dart';

import '../../../core/error/Failure.dart';
import 'entities/message_entity.dart';
import 'entities/send_message_entity.dart';

abstract class MessageRepository {
  Future<Either<Failure, Unit>> sendMessage(SendMessageEntity message);

  Stream<Either<Failure, List<MessageEntity>>> watchMessages(
    String interviewId,
  );

  Future<Either<Failure, List<MessageEntity>>> getMessages(String interviewId);

  Future<Either<Failure, Unit>> deleteMessages(String interviewId);
}
