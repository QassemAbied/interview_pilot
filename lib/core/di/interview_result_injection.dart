import 'package:get_it/get_it.dart';

import '../../feature/interview_result/data/data_source/interview_result_remote_data_source.dart';
import '../../feature/interview_result/data/data_source/interview_result_remote_data_source_impl.dart';
import '../../feature/interview_result/data/interview_result_repository_impl.dart';
import '../../feature/interview_result/domain/interview_result_repository.dart';
import '../../feature/interview_result/domain/use_case/generate_evaluation_use_case.dart';
import '../../feature/interview_result/domain/use_case/get_evaluation_use_case.dart';
import '../../feature/interview_result/domain/use_case/save_evaluation_use_case.dart';
import '../../feature/interview_result/presentation/controller/interview_result_cubit.dart';
import '../services/pdf_service/interview_pdf_service.dart';
import '../services/pdf_service/templates/interview_pdf_template.dart';
import '../services/supabase_service/supabase_interview_evaluation.dart';

void initInterviewResultInjection(GetIt sl) {
  sl.registerLazySingleton(() => SupABaseInterviewEvaluation());

  sl.registerLazySingleton<InterviewResultRepository>(
    () => InterviewResultRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<InterviewResultRemoteDataSource>(
    () => InterviewResultRemoteDataSourceImpl(
      messageService: sl(),
      evaluationService: sl(),
      groqService: sl(),
    ),
  );
  sl.registerLazySingleton(() => GenerateEvaluationUseCase(sl()));
  sl.registerLazySingleton(() => SaveEvaluationUseCase(sl()));
  sl.registerLazySingleton(() => GetEvaluationUseCase(sl()));

  sl.registerFactory(
    () => InterviewResultCubit(
      generateInterviewEvaluationUseCase: sl(),
      saveInterviewEvaluationUseCase: sl(),
      getInterviewEvaluationUseCase: sl(),
      getInterviewUseCase: sl(),
    ),
  );

  sl.registerLazySingleton<InterviewPdfTemplate>(
    () => const InterviewPdfTemplate(),
  );

  sl.registerLazySingleton<InterviewPdfService>(
    () => InterviewPdfService(template: sl()),
  );
}
