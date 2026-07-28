import 'package:dartz/dartz.dart';
import '../../../../core/error/Failure.dart';
import '../../history/domain/interview_history_repository.dart';
import '../domain/entities/statistics_entity.dart';
import '../domain/services/statistics_calculator.dart';
import '../domain/statistics_repository.dart';

class StatisticsRepositoryImpl implements StatisticsRepository {
  final InterviewHistoryRepository interviewHistoryRepository;
  final StatisticsCalculator calculator;

  const StatisticsRepositoryImpl({
    required this.interviewHistoryRepository,
    required this.calculator,
  });

  @override
  Future<Either<Failure, StatisticsEntity>> getStatistics() async {
    final result = await interviewHistoryRepository.getInterviewHistory();

    return result.fold(
      (failure) {
        return Left(failure);
      },
      (history) {
        final statistics = calculator.calculate(history);

        return Right(statistics);
      },
    );
  }
}
