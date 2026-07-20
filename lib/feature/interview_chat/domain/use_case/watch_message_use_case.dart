import 'package:dartz/dartz.dart';
import 'package:interview_pilot/core/error/Failure.dart';
import '../entities/message_entity.dart';
import '../message_repository.dart';
class WatchMessageUseCase {
  final MessageRepository repository;

  WatchMessageUseCase(this.repository);

  Stream<Either<Failure, List<MessageEntity>>> call(String interviewId) {
    return repository.watchMessages(interviewId);
  }
}

