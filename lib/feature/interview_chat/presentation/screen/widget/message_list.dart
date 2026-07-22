import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/route_names.dart';
import '../../../../../core/utils/enum/interview_enum.dart';
import '../../../domain/entities/message_entity.dart';
import '../../controller/interview_chat_cubit.dart';
import '../../controller/interview_chat_state.dart';
import 'message_bubble.dart';

class MessageList extends StatefulWidget {
  const MessageList({super.key, required this.interviewId});

  final String interviewId;

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  final ScrollController _controller = ScrollController();
  Timer? _scrollTimer;

  bool _scrollScheduled = false;
  @override
  void dispose() {
    _scrollTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollScheduled) return;

    _scrollScheduled = true;

    _scrollTimer = Timer(const Duration(milliseconds: 80), () {
      _scrollScheduled = false;

      if (!_controller.hasClients) return;

      _controller.animateTo(
        _controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InterviewChatCubit, InterviewChatState>(
      listenWhen: (previous, current) {
        return previous.messages.length != current.messages.length ||
            previous.streamingText != current.streamingText ||
            previous.isAiTyping != current.isAiTyping ||
            previous.isEndInterview != current.isEndInterview;
      },
      listener: (context, state) {
        if (state.isEndInterview) {
          context.pop();
          context.goNamed(
            RouteNames.interviewResult,
            pathParameters: {'interviewId': widget.interviewId},
          );
        }
        _scrollToBottom();
      },
      child: BlocBuilder<InterviewChatCubit, InterviewChatState>(
        builder: (context, state) {
          final messages = state.messages;

          final itemCount =
              messages.length +
              ((state.isAiTyping && state.streamingText.isNotEmpty) ? 1 : 0);

          return ListView.builder(
            controller: _controller,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            itemCount: itemCount,
            itemBuilder: (_, index) {
              if (index < messages.length) {
                return MessageBubble(message: messages[index]);
              }

              // if (state.isAiTyping && state.streamingText.isEmpty) {
              //   return const AiTypingBubble();
              // }

              return MessageBubble(
                message: MessageEntity(
                  id: "stream",
                  interviewId: widget.interviewId,
                  sender: MessageSender.ai,
                  message: state.streamingText,
                  createdAt: DateTime.now(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
