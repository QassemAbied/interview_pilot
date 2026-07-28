import 'package:flutter/material.dart';
import '../../../../../core/helpers/interview_score_helper.dart';
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
    final scoreColor = InterviewScoreHelper.getScoreColor(score);
    final scoreTitle = InterviewScoreHelper.getScoreTitle(score);
    final description = InterviewScoreHelper.getScoreDescription(score);

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
                  valueColor: AlwaysStoppedAnimation(scoreColor),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "$score",
                    style: AppTextStyle.extraBold(size: 42, color: scoreColor),
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

        Text(scoreTitle, style: AppTextStyle.bold(size: 24, color: scoreColor)),

        verticalSpace(12),

        Text(
          description,
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
}
