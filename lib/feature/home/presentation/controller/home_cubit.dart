import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilot/feature/home/domain/use_case/get_all_interview_use_case.dart';

import '../../../../core/helpers/base_use_case.dart';
import '../../../../core/utils/enum/request_status.dart';
import '../../domain/use_case/get_dashboard_use_case.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetAllInterviewUseCase getAllInterviewUseCase;
  final GetDashboardUseCase getDashboardUseCase;


  HomeCubit({required this.getDashboardUseCase, required this.getAllInterviewUseCase}) : super(const HomeState());

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
      (interviews) {
        emit(
          state.copyWith(interviews: interviews, status: RequestStatus.success),
        );
      },
    );
  }

  Future<void> getAllInterview() async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await getAllInterviewUseCase(const NoParams());
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: RequestStatus.error,
            errorMessage: failure.message,
          ),
        );
        },
      (interviews) {
        emit(
          state.copyWith(allInterview: interviews, status: RequestStatus.success),
        );
      },
    );
  }
}
