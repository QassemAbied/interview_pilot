import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:interview_pilot/feature/statistics/presentation/screen/widgets/header_card.dart';
import 'package:intl/intl.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../../domain/entities/performance_point_entity.dart';

class PerformanceChartCard extends StatelessWidget {
  const PerformanceChartCard({super.key, required this.performanceHistory});

  final List<PerformancePointEntity> performanceHistory;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderCard(
            color: AppColors.primary,
            icon: Icons.show_chart_rounded,
            text1: 'Performance Over Time',
            text2: 'Your interview score progression',
          ),

          verticalSpace(28),

          SizedBox(height: 240, child: LineChart(_chartData())),
        ],
      ),
    );
  }

  LineChartData _chartData() {
    return LineChartData(
      minY: 0,
      maxY: 100,

      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 20,
        getDrawingHorizontalLine: (_) {
          return const FlLine(color: AppColors.neutral200, strokeWidth: 1);
        },
      ),

      borderData: FlBorderData(show: false),

      titlesData: FlTitlesData(
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),

        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),

        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 34,
            interval: 20,
            getTitlesWidget: (value, meta) {
              return Text(
                value.toInt().toString(),
                style: AppTextStyle.medium(size: 10, color: AppColors.textHint),
              );
            },
          ),
        ),

        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 34,
            interval: 1,
            getTitlesWidget: _bottomTitle,
          ),
        ),
      ),

      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (spots) {
            return spots.map((spot) {
              final index = spot.x.toInt();

              if (index < 0 || index >= performanceHistory.length) {
                return null;
              }

              final point = performanceHistory[index];

              return LineTooltipItem(
                '${point.score}/100\n${DateFormat('MMM dd, yyyy').format(point.date)}',
                AppTextStyle.semiBold(size: 12, color: AppColors.white),
              );
            }).toList();
          },
        ),
      ),

      lineBarsData: [
        LineChartBarData(
          spots: _spots(),

          isCurved: true,

          curveSmoothness: .3,

          color: AppColors.primary,

          barWidth: 3,

          isStrokeCapRound: true,

          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 4,
                color: AppColors.primary,
                strokeWidth: 2,
                strokeColor: AppColors.white,
              );
            },
          ),

          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primary.withValues(alpha: .20),
                AppColors.primary.withValues(alpha: .01),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<FlSpot> _spots() {
    return List.generate(performanceHistory.length, (index) {
      return FlSpot(
        index.toDouble(),
        performanceHistory[index].score.toDouble(),
      );
    });
  }

  Widget _bottomTitle(double value, TitleMeta meta) {
    final index = value.toInt();

    if (index < 0 || index >= performanceHistory.length) {
      return const SizedBox.shrink();
    }
    if (!_shouldShowBottomTitle(index)) {
      return const SizedBox.shrink();
    }

    final date = performanceHistory[index].date;

    return SideTitleWidget(
      meta: meta,
      child: Text(
        DateFormat('MMM dd,').format(date),
        style: AppTextStyle.medium(size: 10, color: AppColors.textHint),
      ),
    );
  }

  bool _shouldShowBottomTitle(int index) {
    final length = performanceHistory.length;

    if (length <= 5) {
      return true;
    }

    if (index == 0 || index == length - 1) {
      return true;
    }

    final step = (length / 4).ceil();

    return index % step == 0;
  }
}
