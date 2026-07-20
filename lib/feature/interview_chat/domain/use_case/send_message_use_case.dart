import 'package:dartz/dartz.dart';

import '../../../../core/error/Failure.dart';
import '../../../../core/helpers/base_use_case.dart';
import '../entities/send_message_entity.dart';
import '../message_repository.dart';

class SendMessageUseCase extends UseCase<void, SendMessageEntity> {
  final MessageRepository repository;

  SendMessageUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(SendMessageEntity params) async{
    return await repository.sendMessage(params);
  }
}
