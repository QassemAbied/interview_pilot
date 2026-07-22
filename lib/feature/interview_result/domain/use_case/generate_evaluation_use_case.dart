import 'package:dartz/dartz.dart';
import 'package:interview_pilot/core/error/Failure.dart';
import 'package:interview_pilot/core/helpers/base_use_case.dart';

import '../entities/interview_evaluation_entity.dart';
import '../interview_result_repository.dart';

class GenerateEvaluationUseCase
    extends UseCase<InterviewEvaluationEntity, String> {
  final InterviewResultRepository interviewResultRepository;
  GenerateEvaluationUseCase(this.interviewResultRepository);
  @override
  Future<Either<Failure, InterviewEvaluationEntity>> call(String params) async {
    return await interviewResultRepository.generateEvaluation(
      interviewId: params,
    );
  }
}
