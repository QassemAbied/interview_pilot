import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enum/request_status.dart';
import '../../domain/use_cases/get_interview_history_use_case.dart';
import 'interview_history_state.dart';

class InterviewHistoryCubit extends Cubit<InterviewHistoryState> {
  final GetInterviewHistoryUseCase getInterviewHistoryUseCase;

  InterviewHistoryCubit({required this.getInterviewHistoryUseCase})
    : super(const InterviewHistoryState());

  Future<void> getInterviewHistory() async {
    emit(state.copyWith(status: RequestStatus.loading, errorMessage: null));

    final result = await getInterviewHistoryUseCase();

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
          state.copyWith(
            status: RequestStatus.success,
            interviews: interviews,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> refresh() async {
    final result = await getInterviewHistoryUseCase();

    result.fold(
      (failure) {
        emit(state.copyWith(errorMessage: failure.message));
      },
      (interviews) {
        emit(
          state.copyWith(
            status: RequestStatus.success,
            interviews: interviews,
            errorMessage: null,
          ),
        );
      },
    );
  }
}
