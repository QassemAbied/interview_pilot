import 'package:flutter/material.dart';
import 'package:interview_pilot/core/widgets/spacing.dart';

import '../../../../../core/constants/app_spac.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyle.extraBold(size: 30, color: AppColors.textPrimary),
        ),
        verticalSpace(AppSpacing.s8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyle.regular(size: 15, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
