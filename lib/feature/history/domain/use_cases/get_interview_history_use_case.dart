import 'package:dartz/dartz.dart';

import '../../../../core/error/Failure.dart';
import '../entities/interview_history_item_entity.dart';
import '../interview_history_repository.dart';

class GetInterviewHistoryUseCase {
  final InterviewHistoryRepository repository;

  const GetInterviewHistoryUseCase({required this.repository});

  Future<Either<Failure, List<InterviewHistoryItemEntity>>> call() {
    return repository.getInterviewHistory();
  }
}
