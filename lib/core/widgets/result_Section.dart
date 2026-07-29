import 'package:flutter/material.dart';
import 'package:interview_pilot/core/widgets/app_icon_background.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'app_card.dart';
import 'spacing.dart';

class AppResultSection extends StatelessWidget {
  const AppResultSection({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
    required this.color,
  });

  final String title;
  final Color color;
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
              AppIconBackground(color: color, icon: icon),
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
