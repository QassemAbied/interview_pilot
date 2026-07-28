import 'package:dartz/dartz.dart';

import '../../../../core/error/Failure.dart';
import '../entities/statistics_entity.dart';
import '../statistics_repository.dart';

class GetStatisticsUseCase {
  final StatisticsRepository repository;

  const GetStatisticsUseCase({required this.repository});

  Future<Either<Failure, StatisticsEntity>> call() {
    return repository.getStatistics();
  }
}
