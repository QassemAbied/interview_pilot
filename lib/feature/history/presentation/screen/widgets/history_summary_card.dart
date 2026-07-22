import 'package:flutter/material.dart';
import '../../../../../core/helpers/score_helper.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../../domain/entities/interview_history_item_entity.dart';

class HistorySummaryCard extends StatelessWidget {
  const HistorySummaryCard({super.key, required this.interviews});

  final List<InterviewHistoryItemEntity> interviews;

  @override
  Widget build(BuildContext context) {
    final averageScore = ScoreHelper.calculateAverageScore(interviews);
    final bestScore = ScoreHelper.calculateBestScore(interviews);
    return AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: _SummaryItem(
              value: '${interviews.length}',
              label: 'Interviews',
            ),
          ),

          _divider(),

          Expanded(
            child: _SummaryItem(value: '$averageScore', label: 'Avg Score'),
          ),

          _divider(),

          Expanded(
            child: _SummaryItem(value: '$bestScore', label: 'Best Score'),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(width: 1, height: 42, color: AppColors.divider);
  }
}

class _SummaryItem extends StatelessWidget {
  const _SummaryItem({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyle.extraBold(size: 24, color: AppColors.primary),
        ),

        verticalSpace(6),

        Text(
          label,
          textAlign: TextAlign.center,
          style: AppTextStyle.medium(size: 12, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
