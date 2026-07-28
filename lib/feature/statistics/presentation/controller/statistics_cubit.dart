import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enum/request_status.dart';
import '../../domain/use_cases/get_statistics_use_case.dart';
import 'statistics_state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit({required this.getStatisticsUseCase})
    : super(const StatisticsState());

  final GetStatisticsUseCase getStatisticsUseCase;

  Future<void> getStatistics() async {
    emit(state.copyWith(status: RequestStatus.loading));

    final result = await getStatisticsUseCase();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: RequestStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (statistics) {
        emit(
          state.copyWith(status: RequestStatus.success, statistics: statistics),
        );
      },
    );
  }

  Future<void> refresh() async {
    final result = await getStatisticsUseCase();

    result.fold(
      (failure) {
        emit(state.copyWith(errorMessage: failure.message));
      },
      (statistics) {
        emit(
          state.copyWith(status: RequestStatus.success, statistics: statistics),
        );
      },
    );
  }
}
