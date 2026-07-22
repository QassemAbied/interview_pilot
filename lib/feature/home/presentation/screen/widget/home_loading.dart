import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../history/domain/entities/interview_history_item_entity.dart';
import '../home_body.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: HomeBody(
        dashboard: InterviewHistoryItemEntity.dummyList

      ),
    );
  }
}
