import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilot/feature/interview/domain/entities/interview_entity.dart';
import 'package:interview_pilot/feature/interview_chat/domain/use_case/watch_message_use_case.dart';
import '../../../../../core/utils/enum/request_status.dart';
import '../../../../core/error/Failure.dart';
import '../../../../core/utils/enum/interview_enum.dart';
import '../../../ai/domain/entities/send_interview_message_params.dart';
import '../../../ai/domain/use_case/ask_ai_use_case.dart';
import '../../../ai/domain/use_case/send_interview_message_use_case.dart';
import '../../../ai/domain/use_case/start_interview_use_case.dart';
import '../../../interview/domain/entities/update_interview_entity.dart';
import '../../../interview/domain/use_case/get_interview_use_case.dart';
import '../../../interview/domain/use_case/update_interview_use_case.dart';
import '../../domain/entities/message_entity.dart';
import '../../domain/use_case/delete_message_use_case.dart';
import '../../domain/use_case/get_message_use_case.dart';
import '../../domain/use_case/send_message_use_case.dart';
import 'interview_chat_state.dart';

class InterviewChatCubit extends Cubit<InterviewChatState> {
  final SendMessageUseCase sendMessageUseCase;
  final GetMessagesUseCase getMessagesUseCase;
  final WatchMessageUseCase watchMessageUseCase;
  final DeleteMessagesUseCase deleteMessagesUseCase;
  final AskAiUseCase askAiUseCase;
  final GetInterviewUseCase getInterviewUseCase;
  final SendInterviewMessageUseCase sendInterviewMessageUseCase;
  final StartInterviewUseCase startInterviewUseCase;
  final UpdateInterviewUseCase updateInterviewUseCase;
  InterviewChatCubit({
    required this.getMessagesUseCase,
    required this.deleteMessagesUseCase,
    required this.askAiUseCase,
    required this.getInterviewUseCase,
    required this.sendMessageUseCase,
    required this.sendInterviewMessageUseCase,
    required this.watchMessageUseCase,
    required this.startInterviewUseCase,
    required this.updateInterviewUseCase,
  }) : super(const InterviewChatState());

  StreamSubscription<Either<Failure, List<MessageEntity>>>?
  _messagesSubscription;
  bool _waitingForRealtime = false;

  Future<void> initialize(String interviewId) async {
    await loadMessages(interviewId);
    final interviewResult = await getInterviewUseCase(interviewId);

    await interviewResult.fold(
      (failure) async {
        emit(
          state.copyWith(
            status: RequestStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (interview) async {
        emit(state.copyWith(interview: interview));
        final messagesResult = await getMessagesUseCase(interviewId);
        await messagesResult.fold(
          (failure) async {
            emit(
              state.copyWith(
                status: RequestStatus.error,
                errorMessage: failure.message,
              ),
            );
          },
          (messages) async {
            if (messages.isNotEmpty) {
              return;
            }
            await startInterviewMessage(interview);
          },
        );
      },
    );
  }

  Future<void> loadMessages(String interviewId) async {
    emit(state.copyWith(status: RequestStatus.loading));

    await _messagesSubscription?.cancel();

    _messagesSubscription = watchMessageUseCase(interviewId).listen((result) {
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              status: RequestStatus.error,
              errorMessage: failure.message,
            ),
          );
        },
        (messages) {
          final questionCount = messages
              .where((message) => message.sender == MessageSender.ai)
              .length;
          if (_waitingForRealtime &&
              messages.isNotEmpty &&
              state.streamingText.isNotEmpty) {
            final lastMessage = messages.last;

            if (lastMessage.isAI &&
                lastMessage.message.trim() == state.streamingText.trim()) {
              _waitingForRealtime = false;

              emit(
                state.copyWith(
                  status: RequestStatus.success,
                  messages: messages,
                  currentQuestion: questionCount,
                  isAiTyping: false,
                  streamingText: "",
                ),
              );

              return;
            }
          }

          emit(
            state.copyWith(
              status: RequestStatus.success,
              messages: messages,
              currentQuestion: questionCount,
            ),
          );
        },
      );
    });
  }

  @override
  Future<void> close() async {
    await _messagesSubscription?.cancel();
    return super.close();
  }

  Future<void> startInterviewMessage(InterviewEntity interview) async {
    emit(state.copyWith(isAiTyping: true, streamingText: ""));

    bool hasFailure = false;

    await for (final result in startInterviewUseCase(interview)) {
      result.fold(
        (failure) {
          hasFailure = true;

          emit(
            state.copyWith(
              status: RequestStatus.error,
              errorMessage: failure.message,
              isAiTyping: false,
              streamingText: "",
            ),
          );
        },
        (text) {
          emit(state.copyWith(streamingText: text));
        },
      );

      if (hasFailure) {
        return;
      }
    }

    _waitingForRealtime = true;
    emit(state.copyWith(isAiTyping: false));
  }

  Future<void> sendMessage({
    required String interviewId,
    required String message,
  }) async {
    emit(state.copyWith(isAiTyping: true, streamingText: ""));

    bool hasFailure = false;
    bool questionStarted = false;

    await for (final result in sendInterviewMessageUseCase(
      SendInterviewMessageParams(interviewId: interviewId, message: message),
    )) {
      result.fold(
        (failure) {
          hasFailure = true;

          emit(
            state.copyWith(
              status: RequestStatus.error,
              errorMessage: failure.message,
              isAiTyping: false,
              streamingText: "",
            ),
          );
        },
        (text) {
          if (!questionStarted) {
            questionStarted = true;

            emit(
              state.copyWith(
                currentQuestion: state.currentQuestion + 1,
                streamingText: text,
              ),
            );

            return;
          }

          emit(state.copyWith(streamingText: text));
        },
      );

      if (hasFailure) {
        return;
      }
    }

    _waitingForRealtime = true;
  }

  Future endInterview({required InterviewEntity interview}) async {
    emit(state.copyWith(status: RequestStatus.loading));

    final endedAt = DateTime.now();
    final duration = interview.startedAt == null
        ? interview.duration
        : endedAt.difference(interview.startedAt!).inSeconds;

    final result = await updateInterviewUseCase(
      UpdateInterviewEntity(
        id: interview.id,
        jobTitle: interview.jobTitle,
        companyName: interview.companyName,
        jobDescription: interview.jobDescription,
        interviewType: interview.interviewType,
        level: interview.level,
        score: interview.score,
        duration: duration,
        status: InterviewStatus.completed,
        startedAt: interview.startedAt,
        endedAt: endedAt,
      ),
    );
    result.fold(
          (failure) {
        emit(
          state.copyWith(
            status: RequestStatus.error,
            errorMessage: failure.message,
          ),
        );
      },

          (_) {
        emit(
          state.copyWith(status: RequestStatus.success, isEndInterview: true),
        );
      },
    );
  }


  Future<void> deleteMessages(String interviewId) async {
    emit(state.copyWith(status: RequestStatus.loading));

    final result = await deleteMessagesUseCase(interviewId);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: RequestStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (_) {
        emit(const InterviewChatState(status: RequestStatus.success));
      },
    );
  }
}
