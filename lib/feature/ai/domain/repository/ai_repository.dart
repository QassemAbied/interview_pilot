import 'package:dartz/dartz.dart';

import '../../../../core/error/Failure.dart';
import '../../../interview/domain/entities/interview_entity.dart';
import '../entities/ai_request_entity.dart';

abstract class AiRepository {
  Stream<Either<Failure, String>> askAiStream(AiRequestEntity request);

  //Future<Either<Failure, AiResponseEntity>> askAi(AiRequestEntity request);
  Stream<Either<Failure, String>> startInterview(InterviewEntity params);
}
