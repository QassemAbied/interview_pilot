import 'package:flutter/material.dart';
import 'package:interview_pilot/core/widgets/app_icon_background.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/spacing.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({
    super.key,
    required this.color,
    required this.icon,
    required this.text1,
    required this.text2,
  });
  final Color color;
  final IconData icon;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AppIconBackground(color: color, icon: icon),

            horizontalSpace(12),

            Expanded(
              child: Text(
                text1,
                style: AppTextStyle.bold(
                  size: 18,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),

        verticalSpace(8),

        Text(
          text2,
          style: AppTextStyle.regular(size: 13, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
