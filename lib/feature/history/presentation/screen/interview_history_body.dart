import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_pilot/feature/history/presentation/screen/widgets/history_header.dart';
import 'package:interview_pilot/feature/history/presentation/screen/widgets/history_summary_card.dart';
import 'package:interview_pilot/feature/history/presentation/screen/widgets/interview_history_card.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../core/widgets/spacing.dart';
import '../../domain/entities/interview_history_item_entity.dart';
import '../controller/interview_history_cubit.dart';

class InterviewHistoryBody extends StatelessWidget {
  const InterviewHistoryBody({super.key, required this.interviewHistory});

  final List<InterviewHistoryItemEntity> interviewHistory;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return context.read<InterviewHistoryCubit>().refresh();
      },
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20),
        children: [
          const HistoryHeader(),

          verticalSpace(24),

          HistorySummaryCard(interviews: interviewHistory),

          verticalSpace(28),

          ...interviewHistory.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: InterviewHistoryCard(
                item: item,
                onTap: () {
                  context.pushNamed(
                    RouteNames.interviewReport,
                    pathParameters: {'interviewId': item.interview.id},
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
