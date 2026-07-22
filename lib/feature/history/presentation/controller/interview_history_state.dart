import 'package:interview_pilot/core/helpers/base_state.dart';

import '../../../../core/utils/enum/request_status.dart';
import '../../domain/entities/interview_history_item_entity.dart';

class InterviewHistoryState extends BaseState {
  final List<InterviewHistoryItemEntity> interviews;

  const InterviewHistoryState({
    this.interviews = const [],
    super.errorMessage,
    super.status= RequestStatus.initial,
  });

  InterviewHistoryState copyWith({
    RequestStatus? status,
    List<InterviewHistoryItemEntity>? interviews,
    String? errorMessage,
  }) {
    return InterviewHistoryState(
      status: status ?? this.status,
      interviews: interviews ?? this.interviews,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}