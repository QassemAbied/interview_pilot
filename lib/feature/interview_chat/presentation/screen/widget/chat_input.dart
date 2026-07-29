import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_spac.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../controller/interview_chat_cubit.dart';
import '../../controller/interview_chat_state.dart';

class ChatInput extends StatefulWidget {
  const ChatInput({super.key, required this.interviewId});

  final String interviewId;

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final cubit = context.read<InterviewChatCubit>();

    if (cubit.state.isAiTyping) {
      return;
    }

    final text = _controller.text.trim();

    if (text.isEmpty) {
      return;
    }

    cubit.sendMessage(interviewId: widget.interviewId, message: text);

    _controller.clear();
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InterviewChatCubit, InterviewChatState>(
      buildWhen: (previous, current) {
        return previous.isAiTyping != current.isAiTyping ||
            previous.interview != current.interview;
      },
      builder: (context, state) {
        final isAiTyping = state.isAiTyping;
        final interview = state.interview;
        if (interview == null) {
          return const SizedBox.shrink();
        }

        return SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.s16),
            child: Row(
              children: [
                Expanded(
                  child: AppTextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    hintText: interview.isInProgress
                        ? isAiTyping
                              ? 'AI is responding...'
                              : 'Type your answer...'
                        : 'finish interview...',
                    mainLines: 1,
                    maxLines: 3,
                    enabled: interview.isInProgress ? !isAiTyping : false,
                    textInputAction: TextInputAction.send,
                    onSubmitted: isAiTyping
                        ? null
                        : (_) {
                            _sendMessage();
                          },
                  ),
                ),

                horizontalSpace(AppSpacing.s12),

                IconButton.filled(
                  onPressed: interview.isInProgress
                      ? isAiTyping
                            ? null
                            : () {
                                _sendMessage();
                              }
                      : null,
                  icon: isAiTyping
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.send_rounded),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
