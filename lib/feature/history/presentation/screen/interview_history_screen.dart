import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilot/feature/history/presentation/screen/widgets/interview_history_skeleton.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/utils/enum/request_status.dart';
import '../controller/interview_history_cubit.dart';
import '../controller/interview_history_state.dart';
import 'interview_history_body.dart';

class InterviewHistoryScreen extends StatelessWidget {
  const InterviewHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<InterviewHistoryCubit>()..getInterviewHistory(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Interview History')),
        body: BlocBuilder<InterviewHistoryCubit, InterviewHistoryState>(
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
              return InterviewHistoryBody(interviewHistory: state.interviews);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
