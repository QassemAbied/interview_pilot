import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/technical_scores_entity.dart';

class InterviewRadarChart extends StatelessWidget {
  const InterviewRadarChart({super.key, required this.scores});

  final TechnicalScoresEntity scores;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: RadarChart(
        RadarChartData(
          radarShape: RadarShape.polygon,

          radarBorderData: const BorderSide(color: AppColors.neutral300),

          tickBorderData: const BorderSide(color: AppColors.neutral200),

          ticksTextStyle: AppTextStyle.medium(
            size: 10,
            color: AppColors.textSecondary,
          ),

          tickCount: 5,

          gridBorderData: const BorderSide(color: AppColors.neutral200),

          titlePositionPercentageOffset: .18,
          getTitle: (index, angle) {
            switch (index) {
              case 0:
                return RadarChartTitle(text: "Flutter");

              case 1:
                return RadarChartTitle(text: "Architecture");

              case 2:
                return RadarChartTitle(text: "Problem Solving");

              case 3:
                return RadarChartTitle(text: "Communication");

              case 4:
                return RadarChartTitle(text: "Confidence");

              default:
                return const RadarChartTitle(text: "");
            }
          },
          dataSets: [
            RadarDataSet(
              fillColor: AppColors.primary.withValues(alpha: .25),

              borderColor: AppColors.primary,

              entryRadius: 4,

              borderWidth: 3,

              dataEntries: [
                RadarEntry(value: scores.flutter.toDouble()),

                RadarEntry(value: scores.architecture.toDouble()),

                RadarEntry(value: scores.problemSolving.toDouble()),

                RadarEntry(value: scores.communication.toDouble()),

                RadarEntry(value: scores.confidence.toDouble()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
