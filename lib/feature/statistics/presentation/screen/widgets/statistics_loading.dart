import 'package:flutter/material.dart';
import 'package:interview_pilot/feature/statistics/domain/entities/statistics_entity.dart';
import 'package:interview_pilot/feature/statistics/presentation/screen/statistics_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class StatisticsLoading extends StatelessWidget {
  const StatisticsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final statistics = StatisticsEntity.dummy;
    return Skeletonizer(
      enabled: true,
      child: StatisticsBody(statistics: statistics),
    );
  }
}
