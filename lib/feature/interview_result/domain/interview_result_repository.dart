import 'package:dartz/dartz.dart';
import 'package:interview_pilot/core/error/Failure.dart';

import 'entities/interview_evaluation_entity.dart';

abstract class InterviewResultRepository {
  Future<Either<Failure, InterviewEvaluationEntity>> generateEvaluation({
    required String interviewId,
  });

  Future<Either<Failure, Unit>> saveEvaluation(
    InterviewEvaluationEntity evaluation,
  );

  Future<Either<Failure, InterviewEvaluationEntity>> getEvaluation(
    String interviewId,
  );
}
