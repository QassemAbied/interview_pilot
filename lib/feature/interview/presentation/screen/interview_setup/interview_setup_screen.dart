import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilot/feature/interview/presentation/controller/setup_controller/setup_cubit.dart';
import 'package:interview_pilot/feature/interview/presentation/screen/interview_setup/interview_setup_body.dart';
import '../../../../../core/di/injection_container.dart';

class InterviewSetupScreen extends StatelessWidget {
  const InterviewSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SetupCubit>(),
      child: Scaffold(body: SafeArea(child: InterviewSetupBody())),
    );
  }
}
