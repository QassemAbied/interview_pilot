import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/widgets/app_snak_bar.dart';

class CodeBlockWidget extends StatelessWidget {
  const CodeBlockWidget({
    super.key,
    required this.child,
    required this.code,
    required this.language,
  });

  final Widget child;
  final String code;
  final String language;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Header(code: code, language: language),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: IntrinsicWidth(child: child),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.code, required this.language});

  final String code;
  final String language;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      padding: EdgeInsets.symmetric(horizontal: 12),
      color: AppColors.primaryDark,
      child: Row(
        children: [
          Text(
            language.isEmpty ? "Code" : language.toUpperCase(),
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          const Spacer(),
          IconButton(
            splashRadius: 18,
            icon: const Icon(
              Icons.copy_rounded,
              color: Colors.white70,
              size: 18,
            ),
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: code));

              if (context.mounted) {
                AppSnackBar.success(context, message: 'Copied');
              }
            },
          ),
        ],
      ),
    );
  }
}
