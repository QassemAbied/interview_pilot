import 'package:dartz/dartz.dart';

import '../../../../core/error/Failure.dart';
import '../../../../core/helpers/base_use_case.dart';
import '../entities/message_entity.dart';
import '../message_repository.dart';

class GetMessagesUseCase extends UseCase<List<MessageEntity>, String> {
  final MessageRepository messageRepository;
  GetMessagesUseCase(this.messageRepository);

  @override
  Future<Either<Failure, List<MessageEntity>>> call(String params) async {
    return await messageRepository.getMessages(params);
  }
}
