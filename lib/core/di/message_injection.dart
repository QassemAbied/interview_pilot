import 'package:get_it/get_it.dart';

import '../../feature/interview_chat/data/data_source/message_remote_data_source.dart';
import '../../feature/interview_chat/data/data_source/message_remote_data_source_impl.dart';
import '../../feature/interview_chat/data/message_repository_impl.dart';
import '../../feature/interview_chat/domain/message_repository.dart';
import '../../feature/interview_chat/domain/use_case/delete_message_use_case.dart';
import '../../feature/interview_chat/domain/use_case/get_message_use_case.dart';
import '../../feature/interview_chat/domain/use_case/send_message_use_case.dart';
import '../../feature/interview_chat/domain/use_case/watch_message_use_case.dart';
import '../../feature/interview_chat/presentation/controller/interview_chat_cubit.dart';
import '../services/supabase_service/supabase_messages.dart';

void messageInjection(GetIt sl) {
  sl.registerLazySingleton<SupABaseMessage>(() => SupABaseMessage());

  sl.registerLazySingleton<MessageRemoteDataSource>(
    () => MessageRemoteDataSourceImpl(supABaseMessage: sl()),
  );

  sl.registerLazySingleton<MessageRepository>(
    () => MessageRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton(() => SendMessageUseCase(sl()));

  sl.registerLazySingleton(() => GetMessagesUseCase(sl()));
  sl.registerLazySingleton(() => WatchMessageUseCase(sl()));

  sl.registerLazySingleton(() => DeleteMessagesUseCase(sl()));
  sl.registerFactory(
    () => InterviewChatCubit(
      getMessagesUseCase: sl(),
      deleteMessagesUseCase: sl(),
      askAiUseCase: sl(),
      getInterviewUseCase: sl(),
      sendMessageUseCase: sl(),
      sendInterviewMessageUseCase: sl(),
      watchMessageUseCase: sl(),
      startInterviewUseCase: sl(), updateInterviewUseCase: sl(),
    ),
  );
}
