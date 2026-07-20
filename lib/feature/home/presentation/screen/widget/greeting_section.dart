import 'package:flutter/material.dart';

import '../../../../../core/constants/app_spac.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/spacing.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key, required this.userName});

  final String userName;
  String _getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Good Morning';
    }

    if (hour < 18) {
      return 'Good Afternoon';
    }

    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${_getGreeting()},',
          style: AppTextStyle.medium(size: 16, color: AppColors.textSecondary),
        ),

        verticalSpace(AppSpacing.s8),

        Text(
          userName,
          style: AppTextStyle.extraBold(size: 28, color: AppColors.textPrimary),
        ),

        verticalSpace(AppSpacing.s8),

        Text(
          'Ready to ace your next interview?',
          style: AppTextStyle.regular(size: 15, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
