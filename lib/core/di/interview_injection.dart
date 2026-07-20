import 'package:get_it/get_it.dart';
import 'package:interview_pilot/feature/interview/presentation/controller/setup_controller/setup_cubit.dart';
import '../../feature/interview/data/data_source/remote_interview_data_source.dart';
import '../../feature/interview/data/data_source/remote_interview_data_source_impl.dart';
import '../../feature/interview/data/interview_repository_impl.dart';
import '../../feature/interview/domain/interview_repository.dart';
import '../../feature/interview/domain/use_case/create_interview_use_case.dart';
import '../../feature/interview/domain/use_case/delete_interview_use_case.dart';
import '../../feature/interview/domain/use_case/get_all_interview_use_case.dart';
import '../../feature/interview/domain/use_case/get_interview_use_case.dart';
import '../../feature/interview/domain/use_case/update_interview_use_case.dart';
import '../services/supabase_service/supabase_interview.dart';

void initInterviewInjection(GetIt sl) {
  sl.registerLazySingleton(() => SupABaseInterview());
  sl.registerLazySingleton<RemoteInterviewDataSource>(
    () => RemoteInterviewDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<InterviewRepository>(
    () => InterviewRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => CreateInterviewUseCase(sl()));
  sl.registerLazySingleton(() => GetAllInterviewUseCase(sl()));
  sl.registerLazySingleton(() => GetInterviewUseCase(sl()));
  sl.registerLazySingleton(() => UpdateInterviewUseCase(sl()));
  sl.registerLazySingleton(() => DeleteInterviewUseCase(sl()));
  sl.registerFactory(
    () => SetupCubit(
      createInterviewUseCase: sl(),
      getInterviewUseCase: sl(),
    ),
  );
}
