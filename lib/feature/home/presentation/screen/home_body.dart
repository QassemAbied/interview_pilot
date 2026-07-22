import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_pilot/feature/home/presentation/screen/widget/greeting_section.dart';
import 'package:interview_pilot/feature/home/presentation/screen/widget/quick_actions_section.dart';
import 'package:interview_pilot/feature/home/presentation/screen/widget/recent_interviews_section.dart';
import 'package:interview_pilot/feature/home/presentation/screen/widget/start_interview_card.dart';
import 'package:interview_pilot/feature/home/presentation/screen/widget/statistics_section.dart';
import '../../../../app/app_cubit/app_cubit.dart';
import '../../../../core/constants/app_spac.dart';
import '../../../../core/helpers/score_helper.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/spacing.dart';
import '../../../history/domain/entities/interview_history_item_entity.dart';
import '../models/quick_action_model.dart';
import '../models/statistic_model.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.dashboard,});

  final List<InterviewHistoryItemEntity> dashboard;

  @override
  Widget build(BuildContext context) {
    final averageScore = ScoreHelper.calculateAverageScore(dashboard);
    final bestScore = ScoreHelper.calculateBestScore(dashboard);
    final successInterview = ScoreHelper.calculateSuccessInterview(dashboard);


    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(AppSpacing.s16),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GreetingSection(
                  userName:
                      context.watch<AppCubit>().state.user?.name ?? 'Guest',
                ),
                verticalSpace(AppSpacing.s24),
                StartInterviewCard(
                  onTap: () async {
                    context.pushNamed(RouteNames.interviewSetup);
                  },
                ),
                verticalSpace(AppSpacing.s32),
              ],
            ),
          ),
        ),
        QuickActionsSection(
          actions: [
            QuickActionModel(
              title: 'Resume\nAnalysis',
              icon: Icons.description_outlined,
              onTap: () {},
            ),
            QuickActionModel(
              title: 'Interview\nHistory',
              icon: Icons.history,
              onTap: () {
                context.pushNamed(RouteNames.history);
              },
            ),
            QuickActionModel(
              title: 'Statistics',
              icon: Icons.bar_chart_rounded,
              onTap: () {},
            ),
            QuickActionModel(
              title: 'Settings',
              icon: Icons.settings_outlined,
              onTap: () {},
            ),
          ],
        ),
        RecentInterviewsSection(interviews: dashboard.map((e) => e.interview).toList()),
        StatisticsSection(
          statistics: [
            StatisticModel(
              title: 'Interviews',
              value: dashboard.length.toString(),
              icon: Icons.chat_bubble_outline,
              color: AppColors.primary,
            ),
            StatisticModel(
              title: 'Average',
              value: '$averageScore %',
              icon: Icons.bar_chart_rounded,
              color: AppColors.success,
            ),
            StatisticModel(
              title: 'Best Score',
              value: '$bestScore %',
              icon: Icons.workspace_premium_outlined,
              color: AppColors.warning,
            ),
            StatisticModel(
              title: 'Success',
              value: successInterview.toString(),
              icon: Icons.trending_up,
              color: AppColors.info,
            ),
          ],
        ),
      ],
    );
  }
}
