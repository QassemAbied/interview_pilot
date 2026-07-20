import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_pilot/feature/home/presentation/screen/widget/home_empty.dart';
import 'package:interview_pilot/feature/home/presentation/screen/widget/home_error.dart';
import 'package:interview_pilot/feature/home/presentation/screen/widget/home_loading.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/enum/request_status.dart';
import '../controller/home_cubit.dart';
import '../controller/home_state.dart';
import 'home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeCubit>()..getDashboard(),
      child: Scaffold(
        backgroundColor: AppColors.scaffold,
        body: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state.status == RequestStatus.loading) {
                return const HomeLoading();
              }

              if (state.status == RequestStatus.error) {
                return HomeError(
                  message: state.errorMessage ?? 'Unknown Error',
                  onRetry: () {
                    context.read<HomeCubit>().getDashboard();
                  },
                );
              }

              final dashboard = state.dashboard;



              if ( dashboard!.recentInterviews.isEmpty) {
                return HomeEmpty(
                  onStartInterview: () {
                    context.pushNamed(RouteNames.interviewSetup);

                  },
                );
              }

              return HomeBody(dashboard: dashboard);
            },
          ),
        ),
      ),
    );
  }
}
