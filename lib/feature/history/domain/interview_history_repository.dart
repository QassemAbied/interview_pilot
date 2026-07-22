import 'package:dartz/dartz.dart';

import '../../../../core/error/Failure.dart';
import 'entities/interview_history_item_entity.dart';

abstract class InterviewHistoryRepository {
  Future<Either<Failure, List<InterviewHistoryItemEntity>>>
  getInterviewHistory();
}
