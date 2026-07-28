import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../feature/interview_result/domain/entities/technical_scores_entity.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class RadarChartWidget extends StatelessWidget {
  const RadarChartWidget({super.key, required this.scores});
  final TechnicalScoresEntity scores;
  @override
  Widget build(BuildContext context) {
    return RadarChart(
      RadarChartData(
        radarShape: RadarShape.polygon,

        tickCount: 5,

        radarBorderData: const BorderSide(color: AppColors.neutral300),

        gridBorderData: const BorderSide(color: AppColors.neutral200),

        tickBorderData: const BorderSide(color: AppColors.neutral200),

        ticksTextStyle: AppTextStyle.medium(size: 9, color: AppColors.textHint),

        titlePositionPercentageOffset: .18,

        getTitle: (index, angle) {
          switch (index) {
            case 0:
              return const RadarChartTitle(text: 'Flutter');

            case 1:
              return const RadarChartTitle(text: 'Architecture');

            case 2:
              return const RadarChartTitle(text: 'Problem\nSolving');

            case 3:
              return const RadarChartTitle(text: 'Communication');

            case 4:
              return const RadarChartTitle(text: 'Confidence');

            default:
              return const RadarChartTitle(text: '');
          }
        },

        dataSets: [
          RadarDataSet(
            fillColor: AppColors.primary.withValues(alpha: .20),

            borderColor: AppColors.primary,

            borderWidth: 3,

            entryRadius: 4,

            dataEntries: [
              RadarEntry(value: scores.flutter.clamp(0, 100).toDouble()),

              RadarEntry(value: scores.architecture.clamp(0, 100).toDouble()),

              RadarEntry(value: scores.problemSolving.clamp(0, 100).toDouble()),

              RadarEntry(value: scores.communication.clamp(0, 100).toDouble()),

              RadarEntry(value: scores.confidence.clamp(0, 100).toDouble()),
            ],
          ),
        ],
      ),
    );
  }
}
