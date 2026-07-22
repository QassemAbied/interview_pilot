import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../../domain/entities/technical_scores_entity.dart';
import 'interview_radar_chart.dart';
import 'technical_skills_card.dart';

class InterviewAnalyticsCard extends StatelessWidget {
  const InterviewAnalyticsCard({
    super.key,
    required this.scores,
    this.isInsideHero = false,
  });

  final TechnicalScoresEntity scores;
  final bool isInsideHero;

  @override
  Widget build(BuildContext context) {
    final child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.analytics_rounded, color: AppColors.primary),

            horizontalSpace(10),

            Text(
              "Interview Analytics",
              style: AppTextStyle.bold(size: 20, color: AppColors.textPrimary),
            ),
          ],
        ),

        verticalSpace(28),

        InterviewRadarChart(scores: scores),

        verticalSpace(32),

        TechnicalSkillsCard(scores: scores, isInsideHero: true),
      ],
    );

    if (isInsideHero) {
      return child;
    }

    return AppCard(child: child);
  }
}
