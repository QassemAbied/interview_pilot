import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_pilot/feature/history/presentation/screen/widgets/history_header.dart';
import 'package:interview_pilot/feature/history/presentation/screen/widgets/history_summary_card.dart';
import 'package:interview_pilot/feature/history/presentation/screen/widgets/interview_history_card.dart';
import 'package:interview_pilot/feature/history/presentation/screen/widgets/interview_history_skeleton.dart';

import '../../../../core/routing/route_names.dart';
import '../../../../core/utils/enum/request_status.dart';
import '../../../../core/widgets/spacing.dart';
import '../controller/interview_history_cubit.dart';
import '../controller/interview_history_state.dart';

class InterviewHistoryBody extends StatelessWidget {
  const InterviewHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InterviewHistoryCubit, InterviewHistoryState>(
      builder: (context, state) {
        if (state.status == RequestStatus.loading) {
          return InterviewHistorySkeleton();
        }

        if (state.status == RequestStatus.error) {
          return Center(
            child: Text(
              state.errorMessage ?? 'Failed to load interview history.',
            ),
          );
        }

        if (state.status == RequestStatus.success) {
          if (state.interviews.isEmpty) {
            return const Center(child: Text('No interviews yet.'));
          }
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

                HistorySummaryCard(interviews: state.interviews),

                verticalSpace(28),

                ...state.interviews.map(
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
        return const SizedBox();
      },
    );
  }
}
