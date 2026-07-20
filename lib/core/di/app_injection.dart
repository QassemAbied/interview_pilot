import 'package:get_it/get_it.dart';

import '../../app/app_cubit/app_cubit.dart';

void initAppInjection(GetIt sl) {
  sl.registerFactory(
        () => AppCubit(
      sessionService: sl(),
      getUserUseCase: sl(),
    ),
  );}
