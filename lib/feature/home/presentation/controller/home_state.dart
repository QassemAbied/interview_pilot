import '../../../../core/helpers/base_state.dart';
import '../../../../core/utils/enum/request_status.dart';
import '../../../history/domain/entities/interview_history_item_entity.dart';
import '../../../interview/domain/entities/interview_entity.dart';

class HomeState extends BaseState {
  final List<InterviewHistoryItemEntity>? interviews;
  final List<InterviewEntity>?allInterview;

  const HomeState({
    this.interviews = const [],
    this.allInterview = const [],
    super.status,
    super.errorMessage,
  });

  HomeState copyWith({
    List<InterviewHistoryItemEntity>? interviews,
    List<InterviewEntity>?allInterview,
    RequestStatus? status,
    String? errorMessage,
  }) {
    return HomeState(
      interviews: interviews ?? this.interviews,
      allInterview: allInterview ?? this.allInterview,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}
