import 'package:flutter/material.dart';
import '../../../../../core/constants/app_spac.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../models/quick_action_model.dart';

class QuickActionItem extends StatelessWidget {
  const QuickActionItem({
    super.key,
    required this.action,
  });

  final QuickActionModel action;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: action.onTap,
      child: AppCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.primary.withValues(alpha: .1),
                child: Icon(
                  action.icon,
                  color: AppColors.primary,
                  size: 28,
                ),
              ),
            ),

            verticalSpace(AppSpacing.s16),

            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  action.title,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.semiBold(
                    size: 15,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}