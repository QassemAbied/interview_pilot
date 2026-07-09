import 'package:get_it/get_it.dart';

import '../../feature/auth/data/auth_repository_impl.dart';
import '../../feature/auth/data/data_source/auth_remote_data_source.dart';
import '../../feature/auth/data/data_source/auth_remote_data_source_impl.dart';
import '../../feature/auth/domain/auth_repository.dart';
import '../../feature/auth/domain/use_case/create_user_use_case.dart';
import '../../feature/auth/domain/use_case/forget_password_use_case.dart';
import '../../feature/auth/domain/use_case/get_user_use_case.dart';
import '../../feature/auth/domain/use_case/rest_password_use_case.dart';
import '../../feature/auth/domain/use_case/sign_in_use_case.dart';
import '../../feature/auth/domain/use_case/sign_out_use_case.dart';
import '../../feature/auth/domain/use_case/sign_up_use_case.dart';
import '../../feature/auth/domain/use_case/update_user_use_case.dart';
import '../../feature/auth/presentation/controller/auth_cubit.dart';
import '../services/supabase_service/supabase_auth.dart';

void initAuthInjection(GetIt sl) {
  sl.registerLazySingleton(() => SupAbaseAuth());
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(supAbaseAuth: sl()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton(() => SignInUseCase(sl()));

  sl.registerLazySingleton(() => SignUpUseCase(sl()));

  sl.registerLazySingleton(() => SignOutUseCase(sl()));

  sl.registerLazySingleton(() => CreateUserUseCase(sl()));

  sl.registerLazySingleton(() => GetUserUseCase(sl()));

  sl.registerLazySingleton(() => UpdateUserUseCase(sl()));
  sl.registerLazySingleton(() => ForgetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => RestPasswordUseCase(sl()));


  sl.registerFactory(
    () => AuthCubit(
      signInUseCase: sl(),
      signUpUseCase: sl(),
      signOutUseCase: sl(),
      createUserUseCase: sl(),
      getUserUseCase: sl(),
      updateUserUseCase: sl(),
      forgetPasswordUseCase: sl(),
      restPasswordUseCase: sl(),
    ),
  );
}
