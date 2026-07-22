import 'package:get_it/get_it.dart';
import '../../feature/home/domain/use_case/get_dashboard_use_case.dart';
import '../../feature/home/presentation/controller/home_cubit.dart';

void initHomeInjection(GetIt sl) {
  sl.registerLazySingleton(() => GetDashboardUseCase(sl()));

  sl.registerFactory(() => HomeCubit(getDashboardUseCase: sl()));
}
