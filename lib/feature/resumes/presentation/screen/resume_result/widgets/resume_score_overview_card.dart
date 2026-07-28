import 'package:flutter/material.dart';
import '../../../../../../core/helpers/interview_score_helper.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../../../core/widgets/spacing.dart';

class ResumeScoreOverviewCard extends StatelessWidget {
  const ResumeScoreOverviewCard({
    super.key,
    required this.overallScore,
    required this.atsScore,
    this.jobMatchScore,
  });

  final int overallScore;
  final int atsScore;
  final int? jobMatchScore;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          Text(
            'Overall Score',
            style: AppTextStyle.semiBold(
              size: 16,
              color: AppColors.textPrimary,
            ),
          ),

          verticalSpace(16),

          Text(
            '$overallScore',
            style: AppTextStyle.bold(
              size: 44,
              color: InterviewScoreHelper.getScoreColor(overallScore),
            ),
          ),

          Text(
            '/ 100',
            style: AppTextStyle.medium(
              size: 13,
              color: AppColors.textSecondary,
            ),
          ),

          verticalSpace(8),

          Text(
            InterviewScoreHelper.getScoreTitle(overallScore),
            style: AppTextStyle.semiBold(
              size: 14,
              color: InterviewScoreHelper.getScoreColor(overallScore),
            ),
          ),

          verticalSpace(24),

          const Divider(color: AppColors.neutral200),

          verticalSpace(20),

          Row(
            children: [
              Expanded(
                child: _ScoreItem(title: 'ATS Score', score: atsScore),
              ),

              if (jobMatchScore != null) ...[
                Container(height: 52, width: 1, color: AppColors.neutral200),

                Expanded(
                  child: _ScoreItem(title: 'Job Match', score: jobMatchScore!),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _ScoreItem extends StatelessWidget {
  const _ScoreItem({required this.title, required this.score});

  final String title;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyle.medium(size: 13, color: AppColors.textSecondary),
        ),

        verticalSpace(8),

        Text(
          '$score',
          style: AppTextStyle.bold(
            size: 24,
            color: InterviewScoreHelper.getScoreColor(score),
          ),
        ),

        verticalSpace(2),

        Text(
          '/ 100',
          style: AppTextStyle.regular(size: 11, color: AppColors.textHint),
        ),
      ],
    );
  }
}
