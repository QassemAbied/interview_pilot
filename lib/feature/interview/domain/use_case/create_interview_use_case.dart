import 'package:dartz/dartz.dart';
import 'package:interview_pilot/core/error/Failure.dart';
import 'package:interview_pilot/feature/interview/domain/entities/create_interview_entity.dart';
import 'package:interview_pilot/feature/interview/domain/entities/interview_entity.dart';
import 'package:interview_pilot/feature/interview/domain/interview_repository.dart';

import '../../../../core/helpers/base_use_case.dart';

class CreateInterviewUseCase
    extends UseCase<InterviewEntity, CreateInterviewEntity> {
  final InterviewRepository interviewRepository;

  CreateInterviewUseCase(this.interviewRepository);

  @override
  Future<Either<Failure, InterviewEntity>> call(
    CreateInterviewEntity params,
  ) async {
    return await interviewRepository.createInterview(params);
  }
}
