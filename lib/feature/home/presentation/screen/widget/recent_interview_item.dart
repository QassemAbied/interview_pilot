import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../../core/constants/app_spac.dart';
import '../../../../../core/routing/route_names.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/app_circle_avatar.dart';
import '../../../../../core/widgets/score_badge.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../../../history/domain/entities/interview_history_item_entity.dart';

class RecentInterviewItem extends StatelessWidget {
  const RecentInterviewItem({super.key, required this.interview});

  final InterviewHistoryItemEntity interview;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () {
        context.pushNamed(
          RouteNames.interview,
          pathParameters: {'interviewId': interview.interview.id},
        );
      },
      child: Row(
        children: [
          AppCircleAvatar(icon: Icons.smart_toy_outlined),
          horizontalSpace(AppSpacing.s16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  interview.interview.jobTitle,
                  style: AppTextStyle.semiBold(
                    size: 16,
                    color: AppColors.textPrimary,
                  ),
                ),

                verticalSpace(AppSpacing.s8),

                Text(
                  DateFormat(
                    'MMM dd, yyyy',
                  ).format(interview.interview.createdAt),

                  style: AppTextStyle.regular(
                    size: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          ScoreBadge(
            score: interview.evaluation.overallScore,
          ),
        ],
      ),
    );
  }

}
