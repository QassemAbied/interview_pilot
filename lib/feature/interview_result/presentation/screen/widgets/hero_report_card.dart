import 'package:flutter/material.dart';
import 'package:interview_pilot/feature/interview_result/presentation/screen/widgets/result_header.dart';
import 'package:interview_pilot/feature/interview_result/presentation/screen/widgets/score_card.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../../domain/entities/technical_scores_entity.dart';
import 'interview_analytics_card.dart';
import '../../../../../core/widgets/app_card.dart';

class HeroReportCard extends StatelessWidget {
  const HeroReportCard({super.key, required this.score, required this.scores});

  final int score;
  final TechnicalScoresEntity scores;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ResultHeader(),

          verticalSpace(28),

          ScoreCard(score: score, isInsideHero: true),

          verticalSpace(32),

          InterviewAnalyticsCard(scores: scores, isInsideHero: true),
        ],
      ),
    );
  }
}
