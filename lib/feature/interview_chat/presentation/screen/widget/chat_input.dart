// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../../core/constants/app_spac.dart';
// import '../../../../../core/widgets/app_text_field.dart';
// import '../../../../../core/widgets/spacing.dart';
// import '../../controller/interview_chat_cubit.dart';
//
// class ChatInput extends StatefulWidget {
//   const ChatInput({super.key, required this.interviewId});
//
//   final String interviewId;
//
//   @override
//   State<ChatInput> createState() => _ChatInputState();
// }
//
// class _ChatInputState extends State<ChatInput> {
//   final TextEditingController _controller = TextEditingController();
//
//   final FocusNode _focusNode = FocusNode();
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     _focusNode.dispose();
//     super.dispose();
//   }
//
//   void _sendMessage() {
//     final text = _controller.text.trim();
//     final cubit = context.read<InterviewChatCubit>();
//
//     if (cubit.state.isAiTyping) {
//       return;
//     }
//
//     if (text.isEmpty) return;
//
//     context.read<InterviewChatCubit>().sendMessage(
//       interviewId: widget.interviewId,
//       message: text,
//     );
//
//     _controller.clear();
//
//     _focusNode.requestFocus();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: false,
//       child: Padding(
//         padding: const EdgeInsets.all(AppSpacing.s16),
//         child: Row(
//           children: [
//             Expanded(
//               child: AppTextField(
//                 controller: _controller,
//                 focusNode: _focusNode,
//                 hintText: 'Type your answer...',
//                 mainLines: 1,
//                 maxLines: 3,
//                 textInputAction: TextInputAction.send,
//                 onSubmitted: (_) => _sendMessage(),
//               ),
//             ),
//
//             horizontalSpace(AppSpacing.s12),
//
//             IconButton.filled(
//               onPressed: _sendMessage,
//               icon: const Icon(Icons.send_rounded),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
        return previous.isAiTyping != current.isAiTyping;
      },
      builder: (context, state) {
        final isAiTyping = state.isAiTyping;

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
                    hintText: isAiTyping
                        ? 'AI is responding...'
                        : 'Type your answer...',
                    mainLines: 1,
                    maxLines: 3,
                    enabled: !isAiTyping,
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
                  onPressed: isAiTyping
                      ? null
                      : () {
                          _sendMessage();
                        },
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
