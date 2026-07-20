import 'package:flutter/material.dart';
import 'package:markdown_widget/config/all.dart';
import 'package:markdown_widget/widget/blocks/container/blockquote.dart';
import 'package:markdown_widget/widget/blocks/leaf/code_block.dart';
import 'package:markdown_widget/widget/blocks/leaf/heading.dart';
import 'package:markdown_widget/widget/blocks/leaf/paragraph.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import 'code_block_widget.dart';

class ChatMarkdownConfig {
  const ChatMarkdownConfig._();

  static MarkdownConfig build({required bool isUser}) {
    return MarkdownConfig(
      configs: [
        PConfig(
          textStyle: AppTextStyle.medium(
            size: 15,
            color: isUser ? Colors.white : AppColors.textPrimary,
          ),
        ),

        H1Config(
          style: AppTextStyle.bold(
            size: 26,
            color: isUser ? Colors.white : AppColors.textPrimary,
          ),
        ),

        H2Config(
          style: AppTextStyle.bold(
            size: 22,
            color: isUser ? Colors.white : AppColors.textPrimary,
          ),
        ),

        H3Config(
          style: AppTextStyle.bold(
            size: 20,
            color: isUser ? Colors.white : AppColors.textPrimary,
          ),
        ),
        PreConfig().copy(
          wrapper: (Widget child, String text, String language) {
            return CodeBlockWidget(
              code: text,
              language: language,
              child: child,
            );
          },
        ),
        BlockquoteConfig(
          textColor: isUser ? Colors.white70 : AppColors.textSecondary,
          sideColor: AppColors.primary,
        ),
      ],
    );
  }
}
