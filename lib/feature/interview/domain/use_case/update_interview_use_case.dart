import 'package:dartz/dartz.dart';
import 'package:interview_pilot/core/error/Failure.dart';
import 'package:interview_pilot/feature/interview/domain/entities/update_interview_entity.dart';
import 'package:interview_pilot/feature/interview/domain/interview_repository.dart';

import '../../../../core/helpers/base_use_case.dart';

class UpdateInterviewUseCase extends UseCase<Unit, UpdateInterviewEntity> {
  final InterviewRepository interviewRepository;

  UpdateInterviewUseCase(this.interviewRepository);

  @override
  Future<Either<Failure, Unit>> call(UpdateInterviewEntity params) async {
    return await interviewRepository.updateInterview(params);
  }
}
