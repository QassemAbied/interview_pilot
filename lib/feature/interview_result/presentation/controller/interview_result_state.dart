import 'package:interview_pilot/feature/interview/domain/entities/interview_entity.dart';

import '../../../../core/helpers/base_state.dart';
import '../../../../core/utils/enum/request_status.dart';
import '../../domain/entities/interview_evaluation_entity.dart';

class InterviewResultState extends BaseState {
  final InterviewEvaluationEntity? evaluation;
  final InterviewEntity? interview;

  const InterviewResultState({
    this.evaluation,
    this.interview,
    super.status = RequestStatus.initial,
    super.errorMessage,
  });

  InterviewResultState copyWith({
    InterviewEvaluationEntity? evaluation,
    InterviewEntity? interview,
    RequestStatus? status,
    String? errorMessage,
  }) {
    return InterviewResultState(
      evaluation: evaluation ?? this.evaluation,
      interview: interview ?? this.interview,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
