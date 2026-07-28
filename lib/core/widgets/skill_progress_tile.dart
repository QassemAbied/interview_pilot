import 'package:flutter/material.dart';
import 'package:interview_pilot/core/widgets/score_badge.dart';
import '../../feature/interview_result/domain/entities/technical_scores_entity.dart';
import '../helpers/interview_score_helper.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'spacing.dart';

class TechnicalSkillsCard extends StatelessWidget {
  const TechnicalSkillsCard({
    super.key,
    required this.scores,
    this.isInsideHero = false,
  });

  final TechnicalScoresEntity scores;
  final bool isInsideHero;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkillProgressTile(title: "Flutter", score: scores.flutter),

        verticalSpace(20),

        SkillProgressTile(title: "Architecture", score: scores.architecture),

        verticalSpace(20),

        SkillProgressTile(
          title: "Problem Solving",
          score: scores.problemSolving,
        ),

        verticalSpace(20),

        SkillProgressTile(title: "Communication", score: scores.communication),

        verticalSpace(20),

        SkillProgressTile(title: "Confidence", score: scores.confidence),
      ],
    );
  }
}

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
    final color = InterviewScoreHelper.getScoreColor(score);
    final icon = InterviewScoreHelper.getScoreIcon(score);
    final label = InterviewScoreHelper.getScoreLabel(score);

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

            ScoreBadge(score: score),
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
            Icon(icon, color: color, size: 16),

            horizontalSpace(6),

            Text(label, style: AppTextStyle.medium(size: 13, color: color)),
          ],
        ),
      ],
    );
  }
}
