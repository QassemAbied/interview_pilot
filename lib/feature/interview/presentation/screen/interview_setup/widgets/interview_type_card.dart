import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_spac.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../../../core/widgets/spacing.dart';


class InterviewTypeCard extends StatelessWidget {
  const InterviewTypeCard({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(AppSpacing.s16),
      borderColor: isSelected ? AppColors.primary : AppColors.border,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 34,
            color: isSelected ? AppColors.primary : AppColors.textSecondary,
          ),

          verticalSpace(AppSpacing.s16),

          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyle.semiBold(
              size: 15,
              color: isSelected ? AppColors.primary : AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
