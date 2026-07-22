import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../controller/interview_result_cubit.dart';
import 'interview_result_body.dart';

class InterviewReportScreen extends StatelessWidget {
  const InterviewReportScreen({super.key, required this.interviewId});

  final String interviewId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      sl<InterviewResultCubit>()
        ..initialize(interviewId: interviewId),
      child: const InterviewResultView(),
    );
  }
}

