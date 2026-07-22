import '../../../../core/helpers/base_state.dart';
import '../../../../core/utils/enum/request_status.dart';
import '../../../history/domain/entities/interview_history_item_entity.dart';

class HomeState extends BaseState {
  final List<InterviewHistoryItemEntity>? interviews;

  const HomeState({
    this.interviews = const [],
    super.status,
    super.errorMessage,
  });

  HomeState copyWith({
    List<InterviewHistoryItemEntity>? interviews,
    RequestStatus? status,
    String? errorMessage,
  }) {
    return HomeState(
      interviews: interviews ?? this.interviews,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}
