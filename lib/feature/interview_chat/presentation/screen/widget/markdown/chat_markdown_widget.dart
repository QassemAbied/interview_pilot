import 'package:flutter/material.dart';
import 'package:markdown_widget/widget/all.dart';

import 'markdown_config.dart';

class ChatMarkdownWidget extends StatelessWidget {
  const ChatMarkdownWidget({
    super.key,
    required this.markdown,
    required this.isUser,
  });

  final String markdown;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return MarkdownBlock(
      data: markdown,
      config: ChatMarkdownConfig.build(
        isUser: isUser,
      ),
    );
  }
}