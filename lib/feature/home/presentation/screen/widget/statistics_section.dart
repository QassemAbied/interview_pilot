import 'package:flutter/material.dart';
import '../../../../../core/constants/app_spac.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../models/statistic_model.dart';
import 'statistic_item.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key, required this.statistics});

  final List<StatisticModel> statistics;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(AppSpacing.s16),
      sliver: SliverMainAxisGroup(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Performance Overview',
                  style: AppTextStyle.bold(
                    size: 20,
                    color: AppColors.textPrimary,
                  ),
                ),

                verticalSpace(AppSpacing.s16),
              ],
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return StatisticItem(statistic: statistics[index]);
            }, childCount: statistics.length),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.05,
            ),
          ),
        ],
      ),
    );
  }
}
