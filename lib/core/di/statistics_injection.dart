import 'package:get_it/get_it.dart';

import '../../feature/statistics/data/statistics_repository_impl.dart';
import '../../feature/statistics/domain/services/statistics_calculator.dart';
import '../../feature/statistics/domain/statistics_repository.dart';
import '../../feature/statistics/domain/use_cases/get_statistics_use_case.dart';
import '../../feature/statistics/presentation/controller/statistics_cubit.dart';

void initStatisticsInjection(GetIt sl) {
  sl.registerLazySingleton<StatisticsCalculator>(
    () => const StatisticsCalculator(),
  );
  sl.registerLazySingleton<StatisticsRepository>(
    () => StatisticsRepositoryImpl(
      interviewHistoryRepository: sl(),
      calculator: const StatisticsCalculator(),
    ),
  );
  sl.registerLazySingleton<GetStatisticsUseCase>(
    () => GetStatisticsUseCase(repository: sl()),
  );
  sl.registerFactory<StatisticsCubit>(
    () => StatisticsCubit(getStatisticsUseCase: sl()),
  );
}
