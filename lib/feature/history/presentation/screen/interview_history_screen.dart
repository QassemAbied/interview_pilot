import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../controller/interview_history_cubit.dart';
import 'interview_history_body.dart';

class InterviewHistoryScreen extends StatelessWidget {
  const InterviewHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<InterviewHistoryCubit>()..getInterviewHistory(),
      child:Scaffold(
        appBar: AppBar(
          title: const Text('Interview History'),
        ),
        body: const InterviewHistoryBody(),
      )
    );
  }
}

