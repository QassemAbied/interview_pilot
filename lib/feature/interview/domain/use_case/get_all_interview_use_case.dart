import 'package:dartz/dartz.dart';
import 'package:interview_pilot/core/error/Failure.dart';
import 'package:interview_pilot/feature/interview/domain/entities/interview_entity.dart';
import 'package:interview_pilot/feature/interview/domain/interview_repository.dart';

import '../../../../core/helpers/base_use_case.dart';

class GetAllInterviewUseCase extends UseCase<List<InterviewEntity>, NoParams> {
  final InterviewRepository interviewRepository;

  GetAllInterviewUseCase(this.interviewRepository);

  @override
  Future<Either<Failure, List<InterviewEntity>>> call(NoParams params) async {
    return await interviewRepository.getAllInterview();
  }
}
