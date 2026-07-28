import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/app_icon_background.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../../domain/entities/statistics_entity.dart';

class StatisticsOverview extends StatelessWidget {
  const StatisticsOverview({super.key, required this.statistics});

  final StatisticsEntity statistics;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: _OverviewCard(
                icon: Icons.psychology_alt_rounded,
                value: '${statistics.totalInterviews}',
                title: 'Interviews',
                color: AppColors.primary,
              ),
            ),

            horizontalSpace(12),

            Expanded(
              child: _OverviewCard(
                icon: Icons.analytics_rounded,
                value: '${statistics.averageScore}',
                title: 'Average Score',
                color: AppColors.info,
              ),
            ),
          ],
        ),
        verticalSpace(12),
        Row(
          children: [
            Expanded(
              child: _OverviewCard(
                icon: Icons.emoji_events_rounded,
                value: '${statistics.bestScore}',
                title: 'Best Score',
                color: AppColors.warning,
              ),
            ),

            horizontalSpace(12),

            Expanded(
              child: _OverviewCard(
                icon: _progressIcon(statistics.progressPercentage),
                value: _formatProgress(statistics.progressPercentage),
                title: 'Progress',
                color: _progressColor(statistics.progressPercentage),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _formatProgress(double progress) {
    if (progress > 0) {
      return '+${progress.toStringAsFixed(1)}%';
    }

    return '${progress.toStringAsFixed(1)}%';
  }

  IconData _progressIcon(double progress) {
    if (progress > 0) {
      return Icons.trending_up_rounded;
    }

    if (progress < 0) {
      return Icons.trending_down_rounded;
    }

    return Icons.trending_flat_rounded;
  }

  Color _progressColor(double progress) {
    if (progress > 0) {
      return AppColors.success;
    }

    if (progress < 0) {
      return AppColors.error;
    }

    return AppColors.textSecondary;
  }
}

class _OverviewCard extends StatelessWidget {
  const _OverviewCard({
    required this.icon,
    required this.value,
    required this.title,
    required this.color,
  });

  final IconData icon;
  final String value;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppIconBackground(color: color, icon: icon),

          verticalSpace(16),

          Text(
            value,
            maxLines: 1,
            style: AppTextStyle.extraBold(
              size: 24,
              color: AppColors.textPrimary,
            ),
          ),

          verticalSpace(4),

          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.medium(
              size: 12,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
