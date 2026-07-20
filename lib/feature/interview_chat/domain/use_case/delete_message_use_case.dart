import 'package:dartz/dartz.dart';

import '../../../../core/error/Failure.dart';
import '../../../../core/helpers/base_use_case.dart';
import '../message_repository.dart';

class DeleteMessagesUseCase extends UseCase<void, String> {
  final MessageRepository repository;

  DeleteMessagesUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String params)async {
    return await repository.deleteMessages(params);
  }
}
