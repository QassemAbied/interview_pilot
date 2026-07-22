import 'package:get_it/get_it.dart';

import '../../feature/history/data/data_source/interview_history_remote_data_source.dart';
import '../../feature/history/data/data_source/interview_history_remote_data_source_impl.dart';
import '../../feature/history/data/interview_history_repository_impl.dart';
import '../../feature/history/domain/interview_history_repository.dart';
import '../../feature/history/domain/use_cases/get_interview_history_use_case.dart';
import '../../feature/history/presentation/controller/interview_history_cubit.dart';

void initHistoryInjection(GetIt sl){
  sl.registerLazySingleton<InterviewHistoryRemoteDataSource>(
        () => InterviewHistoryRemoteDataSourceImpl(
      interviewService: sl(),
      evaluationService: sl(),
    ),
  );

  sl.registerLazySingleton<InterviewHistoryRepository>(
        () => InterviewHistoryRepositoryImpl(
      remoteDataSource: sl(),

    ),
  );

  sl.registerLazySingleton<GetInterviewHistoryUseCase>(
        () => GetInterviewHistoryUseCase(
      repository: sl(),
    ),
  );

  sl.registerFactory<InterviewHistoryCubit>(
        () => InterviewHistoryCubit(
      getInterviewHistoryUseCase: sl(),
    ),
  );
}