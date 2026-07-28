import 'package:flutter/material.dart';
import 'package:interview_pilot/core/widgets/app_icon_background.dart';

import '../../../../../core/helpers/interview_score_helper.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/score_badge.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../../domain/entities/skill_performance_entity.dart';

class StatisticsInsights extends StatelessWidget {
  const StatisticsInsights({
    super.key,
    required this.strongestSkill,
    required this.focusArea,
  });

  final SkillPerformanceEntity strongestSkill;
  final SkillPerformanceEntity focusArea;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _InsightCard(
          title: 'Strongest Skill',
          skill: strongestSkill,
          icon: Icons.emoji_events_rounded,
          color: AppColors.success,
        ),

        verticalSpace(16),

        _InsightCard(
          title: 'Focus Area',
          skill: focusArea,
          icon: Icons.track_changes_rounded,
          color: AppColors.warning,
        ),
      ],
    );
  }
}

class _InsightCard extends StatelessWidget {
  const _InsightCard({
    required this.title,
    required this.skill,
    required this.icon,
    required this.color,
  });

  final String title;
  final SkillPerformanceEntity skill;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final scoreColor = InterviewScoreHelper.getScoreColor(skill.score);
    final scoreTitle = InterviewScoreHelper.getScoreTitle(skill.score);

    return AppCard(
      child: Row(
        children: [
          AppIconBackground(color: color, icon: icon),
          horizontalSpace(16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.medium(
                    size: 13,
                    color: AppColors.textSecondary,
                  ),
                ),

                verticalSpace(5),

                Text(
                  skill.name,
                  style: AppTextStyle.bold(
                    size: 18,
                    color: AppColors.textPrimary,
                  ),
                ),

                verticalSpace(5),

                Text(
                  scoreTitle,
                  style: AppTextStyle.medium(size: 12, color: scoreColor),
                ),
              ],
            ),
          ),

          horizontalSpace(12),
          ScoreBadge(score: skill.score),
        ],
      ),
    );
  }
}
