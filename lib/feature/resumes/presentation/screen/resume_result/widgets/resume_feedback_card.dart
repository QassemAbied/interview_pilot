import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../../../core/widgets/app_icon_background.dart';
import '../../../../../../core/widgets/spacing.dart';

class ResumeFeedbackCard extends StatelessWidget {
  const ResumeFeedbackCard({
    super.key,
    required this.title,
    required this.items,
    required this.icon,
    required this.color,
  });

  final String title;
  final List<String> items;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppIconBackground(color: color, icon: icon),
              horizontalSpace(12),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyle.bold(
                    size: 17,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),

          verticalSpace(18),

          ...List.generate(
            items.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                bottom: index == items.length - 1 ? 0 : 10,
              ),
              child: _FeedbackItem(text: items[index], color: color),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeedbackItem extends StatelessWidget {
  const _FeedbackItem({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: color.withValues(alpha: .10),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check_rounded, size: 14, color: color),
        ),

        horizontalSpace(10),

        Expanded(
          child: Text(
            text,
            style: AppTextStyle.regular(
              size: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
