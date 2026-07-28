import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/spacing.dart';

class StatisticsHeader extends StatelessWidget {
  const StatisticsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Performance',
          style: AppTextStyle.extraBold(size: 26, color: AppColors.textPrimary),
        ),

        verticalSpace(8),

        Text(
          'Track your interview performance and see how your skills are improving over time.',
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
