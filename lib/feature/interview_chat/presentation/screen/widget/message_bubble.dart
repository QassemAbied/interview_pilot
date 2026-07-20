import 'package:flutter/material.dart';
import '../../../../../core/constants/app_spac.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../domain/entities/message_entity.dart';
import '../../../../../core/utils/enum/interview_enum.dart';
import 'markdown/chat_markdown_widget.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.message});

  final MessageEntity message;

  @override
  Widget build(BuildContext context) {
    final isUser = message.sender == MessageSender.user;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 280),
        margin: EdgeInsets.symmetric(vertical: AppSpacing.s8),
        padding: const EdgeInsets.all(AppSpacing.s12),
        decoration: BoxDecoration(
          color: isUser ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: Radius.circular(isUser ? 18 : 4),
            bottomRight: Radius.circular(isUser ? 4 : 18),
          ),
        ),
        child: ChatMarkdownWidget(
          markdown: message.message,
          isUser: isUser,
        ),
      ),
    );
  }
}
