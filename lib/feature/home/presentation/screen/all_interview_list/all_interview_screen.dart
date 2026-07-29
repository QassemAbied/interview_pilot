import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilot/feature/home/presentation/screen/all_interview_list/widget/all_interview_loading.dart';
import '../../../../../core/di/injection_container.dart';
import '../../../../../core/utils/enum/request_status.dart';
import '../../controller/home_cubit.dart';
import '../../controller/home_state.dart';
import 'all_interview_body.dart';

class AllInterviewScreen extends StatelessWidget {
  const AllInterviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>()..getAllInterview(),
      child: Scaffold(
        appBar: AppBar(title: const Text('All Interviews')),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.status == RequestStatus.loading) {
              return AllInterviewLoading();
            }
            if (state.status == RequestStatus.error) {
              return Center(child: Text(state.errorMessage ?? ''));
            }
            final interviews = state.allInterview ?? [];
            return AllInterviewBody(interviews: interviews);
          },
        ),
      ),
    );
  }
}
