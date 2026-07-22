import 'package:dartz/dartz.dart';
import 'package:interview_pilot/core/error/Failure.dart';
import 'package:interview_pilot/core/helpers/base_use_case.dart';
import '../../../history/domain/entities/interview_history_item_entity.dart';
import '../../../history/domain/interview_history_repository.dart';

class GetDashboardUseCase extends UseCase<List<InterviewHistoryItemEntity>, NoParams> {
  final InterviewHistoryRepository homeRepository;

  GetDashboardUseCase(this.homeRepository);

  @override
  Future<Either<Failure, List<InterviewHistoryItemEntity>>> call(NoParams params) async {
    return await homeRepository.getInterviewHistory();
  }
}
