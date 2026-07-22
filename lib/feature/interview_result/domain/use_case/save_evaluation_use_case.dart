import 'package:dartz/dartz.dart';
import 'package:interview_pilot/core/error/Failure.dart';
import 'package:interview_pilot/core/helpers/base_use_case.dart';

import '../entities/interview_evaluation_entity.dart';
import '../interview_result_repository.dart';

class SaveEvaluationUseCase extends UseCase<void, InterviewEvaluationEntity> {
  final InterviewResultRepository interviewResultRepository;
  SaveEvaluationUseCase(this.interviewResultRepository);
  @override
  Future<Either<Failure, void>> call(InterviewEvaluationEntity params) async {
    return await interviewResultRepository.saveEvaluation(params);
  }
}
