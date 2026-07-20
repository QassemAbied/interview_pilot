import 'package:flutter/material.dart';

import '../../../../../core/constants/app_spac.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/spacing.dart';

class StartInterviewCard extends StatelessWidget {
  const StartInterviewCard({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      backgroundColor: AppColors.primary,
      borderColor: AppColors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AI Mock Interview',
                      style: AppTextStyle.bold(
                        size: 22,
                        color: AppColors.white,
                      ),
                    ),

                    verticalSpace(AppSpacing.s12),

                    Text(
                      'Practice real interview questions with AI and receive detailed feedback to improve your performance.',
                      style: AppTextStyle.regular(
                        size: 15,
                        color: AppColors.white.withValues(alpha: .9),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              horizontalSpace(AppSpacing.s16),

              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: .15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.smart_toy_outlined,
                  color: AppColors.white,
                  size: 38,
                ),
              ),
            ],
          ),

          verticalSpace(AppSpacing.s24),

          AppButton(
            title: 'Start Interview',
            onPressed: onTap,
            backgroundColor: AppColors.white,
            textColor: AppColors.primary,
            icon: const Icon(
              Icons.play_arrow_rounded,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
