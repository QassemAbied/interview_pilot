import 'package:dartz/dartz.dart';

import '../../../../core/error/Failure.dart';
import 'entities/statistics_entity.dart';

abstract class StatisticsRepository {
  Future<Either<Failure, StatisticsEntity>> getStatistics();
}
