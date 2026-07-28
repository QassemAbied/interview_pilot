import 'package:flutter/material.dart';
import 'package:interview_pilot/feature/statistics/presentation/screen/widgets/header_card.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/radar_chart.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../../../interview_result/domain/entities/technical_scores_entity.dart';

class StatisticsRadarCard extends StatelessWidget {
  const StatisticsRadarCard({super.key, required this.scores});

  final TechnicalScoresEntity scores;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderCard(
            color: AppColors.primary,
            icon: Icons.radar_rounded,
            text1: 'Performance Breakdown',
            text2: 'A visual overview of your average interview skills',
          ),

          verticalSpace(24),

          SizedBox(height: 300, child: RadarChartWidget(scores: scores)),
        ],
      ),
    );
  }
}
