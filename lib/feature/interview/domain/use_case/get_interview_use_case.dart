import 'package:dartz/dartz.dart';
import 'package:interview_pilot/core/error/Failure.dart';
import 'package:interview_pilot/feature/interview/domain/entities/interview_entity.dart';
import 'package:interview_pilot/feature/interview/domain/interview_repository.dart';

import '../../../../core/helpers/base_use_case.dart';

class GetInterviewUseCase extends UseCase<InterviewEntity, String> {
  final InterviewRepository interviewRepository;

  GetInterviewUseCase(this.interviewRepository);

  @override
  Future<Either<Failure, InterviewEntity>> call(String params) async {
    return await interviewRepository.getInterview(params);
  }
}
