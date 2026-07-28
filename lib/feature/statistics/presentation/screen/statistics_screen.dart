import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilot/feature/statistics/presentation/screen/statistics_body.dart';
import 'package:interview_pilot/feature/statistics/presentation/screen/widgets/statistics_loading.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/utils/enum/request_status.dart';
import '../controller/statistics_cubit.dart';
import '../controller/statistics_state.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<StatisticsCubit>()..getStatistics(),
      child: const _StatisticsView(),
    );
  }
}

class _StatisticsView extends StatelessWidget {
  const _StatisticsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: BlocBuilder<StatisticsCubit, StatisticsState>(
        builder: (context, state) {
          switch (state.status) {
            case RequestStatus.initial:
            case RequestStatus.loading:
              return StatisticsLoading();

            case RequestStatus.error:
              return Center(
                child: Text(state.errorMessage ?? 'Failed to load statistics.'),
              );

            case RequestStatus.success:
              final statistics = state.statistics;

              if (statistics == null) {
                return const SizedBox.shrink();
              }

              if (statistics.totalInterviews == 0) {
                return const Center(
                  child: Text('No statistics available yet.'),
                );
              }

              return StatisticsBody(statistics: statistics);
          }
        },
      ),
    );
  }
}
