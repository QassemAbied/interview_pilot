import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/base_use_case.dart';
import '../../../../core/utils/enum/request_status.dart';
import '../../domain/use_case/get_dashboard_use_case.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetDashboardUseCase getDashboardUseCase;

  HomeCubit({required this.getDashboardUseCase}) : super(const HomeState());

  Future<void> getDashboard() async {
    emit(state.copyWith(status: RequestStatus.loading));

    final result = await getDashboardUseCase(const NoParams());

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: RequestStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (dashboard) {
        emit(
          state.copyWith(dashboard: dashboard, status: RequestStatus.success),
        );
      },
    );
  }
}
