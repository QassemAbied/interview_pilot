import '../../../../core/helpers/base_state.dart';
import '../../../../core/utils/enum/request_status.dart';
import '../../../interview/domain/entities/interview_entity.dart';
import '../../domain/entities/message_entity.dart';

class InterviewChatState extends BaseState {
  final List<MessageEntity> messages;
  final bool isEndInterview;
  final bool isAiTyping;
  final InterviewEntity? interview;
  final String streamingText;
  final int currentQuestion;
  final int totalQuestions;
  const InterviewChatState({
    this.messages = const [],
    this.interview,
    this.isAiTyping = false,
    this.streamingText = "",
    this.currentQuestion = 0,
    this.totalQuestions = 10,
    this.isEndInterview = false,
    super.status = RequestStatus.initial,
    super.errorMessage,
  });

  InterviewChatState copyWith({
    List<MessageEntity>? messages,
    InterviewEntity? interview,
    bool? isAiTyping,
    String? streamingText,
    bool? isEndInterview,
    RequestStatus? status,
    String? errorMessage,
    int? currentQuestion,
    int? totalQuestions,
  }) {
    return InterviewChatState(
      messages: messages ?? this.messages,
      interview: interview ?? this.interview,
      isAiTyping: isAiTyping ?? this.isAiTyping,
      streamingText: streamingText ?? this.streamingText,
      status: status ?? this.status,
      isEndInterview: isEndInterview ?? this.isEndInterview,
      currentQuestion: currentQuestion ?? this.currentQuestion,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      errorMessage: errorMessage,
    );
  }
}
