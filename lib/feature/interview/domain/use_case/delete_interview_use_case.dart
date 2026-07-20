import 'package:dartz/dartz.dart';

import '../../../../core/error/Failure.dart';
import '../../../../core/helpers/base_use_case.dart';
import '../interview_repository.dart';

class DeleteInterviewUseCase extends UseCase<Unit, String> {
  final InterviewRepository interviewRepository;

  DeleteInterviewUseCase(this.interviewRepository);

  @override
  Future<Either<Failure, Unit>> call(String params) async {
    return await interviewRepository.deleteInterview(params);
  }
}
