import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../domain/entities/interview_history_item_entity.dart';
import '../interview_history_body.dart';

class InterviewHistorySkeleton extends StatelessWidget {
  const InterviewHistorySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final interviews = InterviewHistoryItemEntity.dummyList;

    return Skeletonizer(
      enabled: true,
      child: InterviewHistoryBody(interviewHistory: interviews),
    );
  }
}
