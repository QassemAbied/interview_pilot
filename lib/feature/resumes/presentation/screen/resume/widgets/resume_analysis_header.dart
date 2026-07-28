import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/spacing.dart';

class ResumeAnalysisHeader extends StatelessWidget {
  const ResumeAnalysisHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 76,
          height: 76,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.accent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: .20),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Icon(
            Icons.description_rounded,
            color: AppColors.white,
            size: 38,
          ),
        ),

        verticalSpace(20),

        Text(
          'AI resumes Review',
          textAlign: TextAlign.center,
          style: AppTextStyle.extraBold(size: 24, color: AppColors.textPrimary),
        ),

        verticalSpace(8),

        Text(
          'Get personalized AI feedback and improve your resumes.',
          textAlign: TextAlign.center,
          style: AppTextStyle.regular(
            size: 15,
            height: 1.5,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
