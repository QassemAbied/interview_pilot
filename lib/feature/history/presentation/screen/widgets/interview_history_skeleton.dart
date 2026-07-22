import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/widgets/spacing.dart';
import '../../../domain/entities/interview_history_item_entity.dart';
import 'history_header.dart';
import 'history_summary_card.dart';
import 'interview_history_card.dart';

class InterviewHistorySkeleton extends StatelessWidget {
  const InterviewHistorySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final interviews = InterviewHistoryItemEntity.dummyList;

    return Skeletonizer(
      enabled: true,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const HistoryHeader(),

          verticalSpace(24),

          HistorySummaryCard(interviews: interviews),

          verticalSpace(28),

          ...interviews.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: InterviewHistoryCard(item: item, onTap: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
