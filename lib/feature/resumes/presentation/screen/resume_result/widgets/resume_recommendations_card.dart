import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../../../core/widgets/app_icon_background.dart';
import '../../../../../../core/widgets/spacing.dart';

class ResumeRecommendationsCard extends StatelessWidget {
  const ResumeRecommendationsCard({super.key, required this.recommendations});

  final List<String> recommendations;

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
                icon: Icons.lightbulb_outline_rounded,
              ),
              horizontalSpace(12),
              Text(
                'Recommendations',
                style: AppTextStyle.bold(
                  size: 17,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),

          verticalSpace(18),

          ...List.generate(recommendations.length, (index) {
            return Padding(
              padding: EdgeInsets.only(
                // bottom: 30
                bottom: index == recommendations.length - 1 ? 0 : 12,
              ),
              child: _RecommendationItem(
                number: index + 1,
                recommendation: recommendations[index],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _RecommendationItem extends StatelessWidget {
  const _RecommendationItem({
    required this.number,
    required this.recommendation,
  });

  final int number;
  final String recommendation;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 28,
          height: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: .10),
            shape: BoxShape.circle,
          ),
          child: Text(
            '$number',
            style: AppTextStyle.semiBold(size: 12, color: AppColors.primary),
          ),
        ),

        horizontalSpace(12),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              recommendation,
              style: AppTextStyle.regular(
                size: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
