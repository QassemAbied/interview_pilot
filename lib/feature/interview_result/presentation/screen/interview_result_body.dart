import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilot/feature/interview_result/presentation/screen/widgets/ai_summary_card.dart';
import 'package:interview_pilot/feature/interview_result/presentation/screen/widgets/feature_list_card.dart';
import 'package:interview_pilot/feature/interview_result/presentation/screen/widgets/hero_report_card.dart';
import 'package:interview_pilot/feature/interview_result/presentation/screen/widgets/interview_result_loading.dart';
import 'package:interview_pilot/feature/interview_result/presentation/screen/widgets/result_action.dart';
import 'package:interview_pilot/feature/interview_result/presentation/screen/widgets/result_actions.dart';
import 'package:interview_pilot/feature/interview_result/presentation/screen/widgets/result_chip.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/enum/request_status.dart';
import '../../../../core/widgets/spacing.dart';
import '../controller/interview_result_cubit.dart';
import '../controller/interview_result_state.dart';

class InterviewResultView extends StatelessWidget {
  const InterviewResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI Interview Report")),
      body: BlocBuilder<InterviewResultCubit, InterviewResultState>(
        builder: (context, state) {
          switch (state.status) {
            case RequestStatus.loading:
              return const InterviewResultSkeleton();
            case RequestStatus.error:
              return Center(
                child: Text(state.errorMessage ?? "Something went wrong."),
              );

            case RequestStatus.success:
              final evaluation = state.evaluation!;

              return SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeroReportCard(
                        score: evaluation.overallScore,
                        scores: evaluation.technicalScores,
                      ),

                      verticalSpace(24),

                      AiSummaryCard(summary: evaluation.overallFeedback),

                      verticalSpace(24),

                      FeatureListCard(
                        title: "Strengths",
                        icon: Icons.workspace_premium_rounded,
                        color: AppColors.success,
                        items: evaluation.strengths,
                      ),

                      verticalSpace(20),

                      FeatureListCard(
                        title: "Areas to Improve",
                        icon: Icons.trending_up_rounded,
                        color: AppColors.warning,
                        items: evaluation.weaknesses,
                      ),

                      verticalSpace(20),

                      ResultSection(
                        title: "Recommendations",
                        icon: Icons.rocket_launch_rounded,
                        child: Column(
                          children: evaluation.recommendations
                              .map(
                                (item) => ResultChip(
                                  text: item,
                                  icon: Icons.arrow_forward_ios_rounded,
                                  color: AppColors.primary,
                                ),
                              )
                              .toList(),
                        ),
                      ),

                      verticalSpace(32),

                       ResultActions(
                         evaluation: evaluation,
                         interview: state.interview!,
                       ),

                      verticalSpace(20),
                    ],
                  ),
                ),
              );

            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
