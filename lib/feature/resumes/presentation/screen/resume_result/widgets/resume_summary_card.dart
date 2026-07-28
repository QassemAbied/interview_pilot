import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../../../core/widgets/app_icon_background.dart';
import '../../../../../../core/widgets/spacing.dart';

class ResumeSummaryCard extends StatelessWidget {
  const ResumeSummaryCard({super.key, required this.summary});

  final String summary;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppIconBackground(
                color: AppColors.primary,
                icon: Icons.auto_awesome_rounded,
              ),
              horizontalSpace(12),
              Text(
                'AI Summary',
                style: AppTextStyle.bold(
                  size: 17,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),

          verticalSpace(16),
          Text(
            summary,
            style: AppTextStyle.regular(
              size: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
