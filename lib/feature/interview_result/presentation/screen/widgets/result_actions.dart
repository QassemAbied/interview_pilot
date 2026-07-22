import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/spacing.dart';

class ResultSection extends StatelessWidget {
  const ResultSection({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
  });

  final String title;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.primary),
              horizontalSpace(10),
              Text(
                title,
                style: AppTextStyle.semiBold(
                  size: 18,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          verticalSpace(20),
          child,
        ],
      ),
    );
  }
}
