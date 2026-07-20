import 'package:dartz/dartz.dart';
import '../../../../../core/error/Failure.dart';
import '../entities/send_interview_message_params.dart';

abstract class AiInterviewRepository {
  Stream<Either<Failure, String>> sendInterviewMessage(
  SendInterviewMessageParams params,
  );

}
