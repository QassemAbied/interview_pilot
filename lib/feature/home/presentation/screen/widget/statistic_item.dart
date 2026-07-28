import 'package:flutter/material.dart';
import 'package:interview_pilot/core/widgets/app_icon_background.dart';
import '../../../../../core/constants/app_spac.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../models/statistic_model.dart';

class StatisticItem extends StatelessWidget {
  const StatisticItem({super.key, required this.statistic});

  final StatisticModel statistic;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: AppIconBackground(
                color: statistic.color,
                icon: statistic.icon,
              ),
            ),
          ),

          verticalSpace(AppSpacing.s16),
          Expanded(
            child: Column(
              children: [
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      statistic.value,
                      style: AppTextStyle.extraBold(
                        size: 15,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),

                verticalSpace(AppSpacing.s8),

                Flexible(
                  child: FittedBox(
                    child: Text(
                      statistic.title,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.medium(
                        size: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
