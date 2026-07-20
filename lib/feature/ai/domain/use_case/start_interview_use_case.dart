import 'package:dartz/dartz.dart';
import 'package:interview_pilot/feature/interview/domain/entities/interview_entity.dart';
import '../../../../core/error/Failure.dart';
import '../repository/ai_repository.dart';

class StartInterviewUseCase {
  final AiRepository repository;

  StartInterviewUseCase(this.repository);

  Stream<Either<Failure, String>> call(InterviewEntity params) {
    return repository.startInterview(params);
  }
}
