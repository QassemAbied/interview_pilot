import 'package:interview_pilot/core/helpers/base_state.dart';
import 'package:interview_pilot/core/utils/enum/request_status.dart';
import '../../../../../core/utils/enum/interview_enum.dart';
import '../../../domain/entities/interview_entity.dart';

class SetupState extends BaseState {
  final InterviewEntity? interview;
  final InterviewType interviewType;

  final ExperienceLevel experienceLevel;
  const SetupState({
    this.interviewType = InterviewType.technical,
    this.experienceLevel = ExperienceLevel.intern,
    this.interview,
    super.status,
    super.errorMessage,
  });
  SetupState copyWith({
    InterviewEntity? interview,
    InterviewType? interviewType,
    ExperienceLevel? experienceLevel,
    RequestStatus? status,
    String? errorMessage,
  }) {
    return SetupState(
      interview: interview ?? this.interview,
      interviewType: interviewType ?? this.interviewType,
      experienceLevel: experienceLevel ?? this.experienceLevel,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}
