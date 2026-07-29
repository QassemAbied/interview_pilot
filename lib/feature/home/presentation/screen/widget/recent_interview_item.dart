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
import '../../../../interview/domain/entities/interview_entity.dart';

class RecentInterviewItem extends StatelessWidget {
  const RecentInterviewItem({
    super.key,
    required this.interview,
    this.interviews,
  });

  final InterviewHistoryItemEntity? interviews;
  final InterviewEntity interview;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () {
        context.pushNamed(
          RouteNames.interview,
          pathParameters: {'interviewId': interview.id},
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
                  interview.jobTitle,
                  style: AppTextStyle.semiBold(
                    size: 16,
                    color: AppColors.textPrimary,
                  ),
                ),

                verticalSpace(AppSpacing.s8),

                Text(
                  DateFormat('MMM dd, yyyy').format(interview.createdAt),

                  style: AppTextStyle.regular(
                    size: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          interviews == null
              ? Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: .10),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: .20),
                    ),
                  ),
                  child: Text(
                    interview.status.name,
                    style: AppTextStyle.bold(
                      size: 15,
                      color: AppColors.primary,
                    ),
                  ),
                )
              : ScoreBadge(score: interviews!.evaluation.overallScore),
        ],
      ),
    );
  }
}
