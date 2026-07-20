import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../feature/ai/data/data_source/ai_remote_data_source.dart';
import '../../feature/ai/data/data_source/ai_remote_data_source_impl.dart';
import '../../feature/ai/data/repository_impl/ai_interview_repository_impl.dart';
import '../../feature/ai/data/repository_impl/ai_repository_impl.dart';
import '../../feature/ai/domain/repository/ai_interview_repository.dart';
import '../../feature/ai/domain/repository/ai_repository.dart';
import '../../feature/ai/domain/use_case/ask_ai_use_case.dart';
import '../../feature/ai/domain/use_case/send_interview_message_use_case.dart';
import '../../feature/ai/domain/use_case/start_interview_use_case.dart';
import '../services/ai_service/groq_service.dart';

void initAiInjection(GetIt sl) {
  sl.registerLazySingleton(
        () => GroqService(
      dio: Dio(
        BaseOptions(
          baseUrl: "https://api.groq.com/openai/v1",
        ),
      ),
    ),
  );
  sl.registerLazySingleton<AiRemoteDataSource>(
    () => AiRemoteDataSourceImpl(groqService: sl()),
  );

  sl.registerLazySingleton<AiRepository>(
    () => AiRepositoryImpl(remoteDataSource: sl(), messageRepository: sl()),
  );

  sl.registerLazySingleton(() => AskAiUseCase(sl()));
  sl.registerLazySingleton<AiInterviewRepository>(
    () => AiInterviewRepositoryImpl(
      messageRepository: sl(),
      interviewRepository: sl(),
      aiRepository: sl(),
    ),
  );

  sl.registerLazySingleton(() => SendInterviewMessageUseCase(sl()));
  sl.registerLazySingleton(() => StartInterviewUseCase(sl()));
}
