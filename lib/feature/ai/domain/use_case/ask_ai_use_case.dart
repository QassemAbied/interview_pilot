import 'package:dartz/dartz.dart';
import '../../../../core/error/Failure.dart';
import '../repository/ai_repository.dart';
import '../entities/ai_request_entity.dart';

class AskAiUseCase {
  final AiRepository repository;

  AskAiUseCase(this.repository);

  Stream<Either<Failure, String>> call(AiRequestEntity params) {
    return repository.askAiStream(params);
  }
}
