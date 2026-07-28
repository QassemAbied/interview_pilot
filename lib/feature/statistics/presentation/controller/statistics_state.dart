import 'package:interview_pilot/core/helpers/base_state.dart';

import '../../../../core/utils/enum/request_status.dart';
import '../../domain/entities/statistics_entity.dart';

class StatisticsState extends BaseState {
  final StatisticsEntity? statistics;

  const StatisticsState({
    super.status = RequestStatus.initial,
    this.statistics,
    super.errorMessage,
  });

  StatisticsState copyWith({
    RequestStatus? status,
    StatisticsEntity? statistics,
    String? errorMessage,
  }) {
    return StatisticsState(
      status: status ?? this.status,
      statistics: statistics ?? this.statistics,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
