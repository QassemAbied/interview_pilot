import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/spacing.dart';

class SkillProgressTile extends StatelessWidget {
  const SkillProgressTile({
    super.key,
    required this.title,
    required this.score,
  });

  final String title;
  final int score;

  @override
  Widget build(BuildContext context) {
    final color = _color(score);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyle.semiBold(
                  size: 15,
                  color: AppColors.textPrimary,
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: color.withValues(alpha: .12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "$score%",
                style: AppTextStyle.bold(size: 13, color: color),
              ),
            ),
          ],
        ),

        verticalSpace(10),

        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: LinearProgressIndicator(
            value: score / 100,
            minHeight: 8,
            backgroundColor: AppColors.neutral200,
            valueColor: AlwaysStoppedAnimation(color),
          ),
        ),

        verticalSpace(8),

        Row(
          children: [
            Icon(_icon(score), color: color, size: 16),

            horizontalSpace(6),

            Text(
              _label(score),
              style: AppTextStyle.medium(size: 13, color: color),
            ),
          ],
        ),
      ],
    );
  }

  Color _color(int score) {
    if (score >= 90) {
      return AppColors.success;
    }

    if (score >= 80) {
      return AppColors.primary;
    }

    if (score >= 70) {
      return AppColors.warning;
    }

    return AppColors.error;
  }

  IconData _icon(int score) {
    if (score >= 90) {
      return Icons.verified_rounded;
    }

    if (score >= 80) {
      return Icons.thumb_up_alt_rounded;
    }

    if (score >= 70) {
      return Icons.trending_up_rounded;
    }

    return Icons.priority_high_rounded;
  }

  String _label(int score) {
    if (score >= 90) {
      return "Excellent";
    }

    if (score >= 80) {
      return "Very Good";
    }

    if (score >= 70) {
      return "Good";
    }

    return "Needs Improvement";
  }
}
