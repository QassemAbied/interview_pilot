import 'package:flutter/material.dart';

import '../../../../../core/constants/app_spac.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/spacing.dart';

class HomeEmpty extends StatelessWidget {
  const HomeEmpty({super.key, required this.onStartInterview});

  final VoidCallback onStartInterview;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.s24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.mic_none_rounded,
              size: 70,
              color: AppColors.primary,
            ),

            verticalSpace(AppSpacing.s24),

            Text(
              'No Interviews Yet',
              style: AppTextStyle.bold(size: 22, color: AppColors.textPrimary),
            ),

            verticalSpace(AppSpacing.s12),

            Text(
              'Start your first AI interview and track your progress.',
              textAlign: TextAlign.center,
              style: AppTextStyle.regular(
                size: 15,
                color: AppColors.textSecondary,
              ),
            ),

            verticalSpace(AppSpacing.s32),

            AppButton(title: 'Start Interview', onPressed: onStartInterview),
          ],
        ),
      ),
    );
  }
}
