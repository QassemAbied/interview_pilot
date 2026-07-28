import 'package:flutter/material.dart';
import 'package:interview_pilot/feature/statistics/presentation/screen/widgets/header_card.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/skill_progress_tile.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../../../interview_result/domain/entities/technical_scores_entity.dart';

class SkillsPerformanceCard extends StatelessWidget {
  const SkillsPerformanceCard({super.key, required this.scores});

  final TechnicalScoresEntity scores;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderCard(
            color: AppColors.primary,
            icon: Icons.bar_chart_rounded,
            text1: 'Skills Performance',
            text2: 'Your average performance across all interviews',
          ),

          verticalSpace(28),
          TechnicalSkillsCard(scores: scores, isInsideHero: false),
        ],
      ),
    );
  }
}
