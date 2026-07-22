import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/spacing.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({super.key, required this.score, this.isInsideHero = false});

  final int score;
  final bool isInsideHero;

  @override
  Widget build(BuildContext context) {
    final child = Column(
      children: [
        SizedBox(
          width: 140,
          height: 140,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 140,
                height: 140,
                child: CircularProgressIndicator(
                  value: score / 100,
                  strokeWidth: 10,
                  backgroundColor: AppColors.neutral200,
                  valueColor: AlwaysStoppedAnimation(_scoreColor(score)),
                ),
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "$score",
                    style: AppTextStyle.extraBold(
                      size: 42,
                      color: _scoreColor(score),
                    ),
                  ),

                  Text(
                    "/100",
                    style: AppTextStyle.medium(
                      size: 15,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        verticalSpace(24),

        Text(
          _scoreTitle(score),
          style: AppTextStyle.bold(size: 24, color: _scoreColor(score)),
        ),

        verticalSpace(12),

        Text(
          _description(score),
          textAlign: TextAlign.center,
          style: AppTextStyle.regular(
            size: 15,
            color: AppColors.textSecondary,
            height: 1.7,
          ),
        ),
      ],
    );

    if (isInsideHero) {
      return child;
    }

    return AppCard(child: child);
  }

  Color _scoreColor(int score) {
    if (score >= 90) return AppColors.success;
    if (score >= 80) return AppColors.primary;
    if (score >= 70) return AppColors.warning;
    return AppColors.error;
  }

  String _scoreTitle(int score) {
    if (score >= 90) return "Excellent";
    if (score >= 80) return "Very Good";
    if (score >= 70) return "Good";
    if (score >= 60) return "Fair";
    return "Needs Improvement";
  }

  String _description(int score) {
    if (score >= 90) {
      return "Outstanding interview performance. Your technical knowledge, communication and confidence were excellent.";
    }

    if (score >= 80) {
      return "Very good interview performance. Continue practicing advanced topics to reach an excellent level.";
    }

    if (score >= 70) {
      return "Good overall performance. Focus on strengthening weak areas and improving consistency.";
    }

    if (score >= 60) {
      return "Fair performance. More interview practice and technical revision will significantly improve your results.";
    }

    return "You're at the beginning of your interview journey. Keep practicing and you'll improve quickly.";
  }
}
