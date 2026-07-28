import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilot/feature/statistics/presentation/screen/widgets/performance_chart_card.dart';
import 'package:interview_pilot/feature/statistics/presentation/screen/widgets/skills_performance_card.dart';
import 'package:interview_pilot/feature/statistics/presentation/screen/widgets/statistics_header.dart';
import 'package:interview_pilot/feature/statistics/presentation/screen/widgets/statistics_insights.dart';
import 'package:interview_pilot/feature/statistics/presentation/screen/widgets/statistics_overview.dart';
import 'package:interview_pilot/feature/statistics/presentation/screen/widgets/statistics_radar_card.dart';

import '../../../../core/widgets/spacing.dart';
import '../../domain/entities/statistics_entity.dart';
import '../controller/statistics_cubit.dart';

class StatisticsBody extends StatelessWidget {
  const StatisticsBody({super.key, required this.statistics});

  final StatisticsEntity statistics;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return context.read<StatisticsCubit>().refresh();
      },
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20),
        children: [
          const StatisticsHeader(),

          verticalSpace(24),

          StatisticsOverview(statistics: statistics),

          verticalSpace(20),

          PerformanceChartCard(
            performanceHistory: statistics.performanceHistory,
          ),

          verticalSpace(20),

          SkillsPerformanceCard(scores: statistics.averageTechnicalScores),

          verticalSpace(20),

          StatisticsRadarCard(scores: statistics.averageTechnicalScores),

          verticalSpace(20),

          StatisticsInsights(
            strongestSkill: statistics.strongestSkill,
            focusArea: statistics.focusArea,
          ),

          verticalSpace(32),
        ],
      ),
    );
  }
}
