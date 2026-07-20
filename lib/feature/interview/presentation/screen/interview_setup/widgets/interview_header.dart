import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_spac.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/spacing.dart';


class InterviewHeader extends StatelessWidget {
  const InterviewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: .1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.record_voice_over_rounded,
            color: AppColors.primary,
            size: 34,
          ),
        ),

        verticalSpace(AppSpacing.s24),

        Text(
          'Start New Interview',
          style: AppTextStyle.bold(size: 24, color: AppColors.textPrimary),
        ),

        verticalSpace(AppSpacing.s12),

        Text(
          'Practice with AI and improve your interview skills.',
          textAlign: TextAlign.center,
          style: AppTextStyle.regular(size: 15, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
