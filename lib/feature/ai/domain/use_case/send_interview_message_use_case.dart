import 'package:dartz/dartz.dart';

import '../../../../core/error/Failure.dart';
import '../entities/send_interview_message_params.dart';
import '../repository/ai_interview_repository.dart';

class SendInterviewMessageUseCase {
  final AiInterviewRepository repository;

  SendInterviewMessageUseCase(this.repository);

  Stream<Either<Failure, String>> call(SendInterviewMessageParams params) {
    return repository.sendInterviewMessage(params);
  }
}
