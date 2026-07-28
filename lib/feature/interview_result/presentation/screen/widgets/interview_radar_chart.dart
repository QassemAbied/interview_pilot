import 'package:flutter/material.dart';
import '../../../../../core/widgets/radar_chart.dart';
import '../../../domain/entities/technical_scores_entity.dart';

class InterviewRadarChart extends StatelessWidget {
  const InterviewRadarChart({super.key, required this.scores});

  final TechnicalScoresEntity scores;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child:RadarChartWidget(
        scores: scores,
      )
    );
  }
}
