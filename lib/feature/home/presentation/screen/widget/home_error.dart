import 'package:flutter/material.dart';
import '../../../../../core/constants/app_spac.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/spacing.dart';

class HomeError extends StatelessWidget {
  const HomeError({super.key, required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.s24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: AppColors.error, size: 70),

            verticalSpace(AppSpacing.s24),

            Text(
              'Something went wrong',
              style: AppTextStyle.bold(size: 22, color: AppColors.textPrimary),
            ),

            verticalSpace(AppSpacing.s12),

            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyle.regular(
                size: 15,
                color: AppColors.textSecondary,
              ),
            ),

            verticalSpace(AppSpacing.s32),

            AppButton(title: 'Retry', onPressed: onRetry),
          ],
        ),
      ),
    );
  }
}
