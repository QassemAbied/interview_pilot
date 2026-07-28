import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../../../core/widgets/app_icon_background.dart';
import '../../../../../../core/widgets/spacing.dart';

class ResumeMissingKeywordsCard extends StatelessWidget {
  const ResumeMissingKeywordsCard({super.key, required this.keywords});

  final List<String> keywords;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppIconBackground(
                color: AppColors.error,
                icon: Icons.warning_amber_rounded,
              ),
              horizontalSpace(12),
              Text(
                'Missing Keywords',
                style: AppTextStyle.bold(
                  size: 17,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          verticalSpace(8),
          Text(
            'Consider adding these relevant keywords to your resume.',
            style: AppTextStyle.regular(
              size: 13,
              color: AppColors.textSecondary,
            ),
          ),

          verticalSpace(18),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: keywords.map((keyword) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: .06),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.error.withValues(alpha: .20),
                  ),
                ),
                child: Text(
                  keyword,
                  style: AppTextStyle.medium(size: 12, color: AppColors.error),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
