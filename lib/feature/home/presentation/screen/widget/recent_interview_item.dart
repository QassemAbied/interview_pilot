import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_pilot/feature/interview/domain/entities/interview_entity.dart';
import '../../../../../core/constants/app_spac.dart';
import '../../../../../core/routing/route_names.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/spacing.dart';

class RecentInterviewItem extends StatelessWidget {
  const RecentInterviewItem({super.key, required this.interview});

  final InterviewEntity interview;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: (){
        context.pushNamed(
          RouteNames.interview,
          pathParameters: {
            'interviewId': interview.id,
          },
        );      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: AppColors.primary.withValues(alpha: .1),
            child: const Icon(
              Icons.smart_toy_outlined,
              color: AppColors.primary,
            ),
          ),

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
                  interview.createdAt.toString(),
                  style: AppTextStyle.regular(
                    size: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: .12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${interview.score}%',
              style: AppTextStyle.bold(size: 15, color: AppColors.success),
            ),
          ),
        ],
      ),
    );
  }
}
