import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/spacing.dart';

class ResultHeader extends StatelessWidget {
  const ResultHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 82,
          height: 82,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.accent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: .30),
                blurRadius: 25,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: const Icon(
            Icons.workspace_premium_rounded,
            color: AppColors.white,
            size: 46,
          ),
        ),

        verticalSpace(24),

        Text(
          'Interview Completed',
          style: AppTextStyle.extraBold(size: 24, color: AppColors.textPrimary),
        ),

        verticalSpace(8),

        Text(
          'Your AI interview has been analyzed successfully.',
          textAlign: TextAlign.center,
          style: AppTextStyle.regular(
            size: 15,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
