import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_spac.dart';
import '../../../../../core/routing/route_names.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../../../history/domain/entities/interview_history_item_entity.dart';
import '../../../../interview/domain/entities/interview_entity.dart';
import 'recent_interview_item.dart';

class RecentInterviewsSection extends StatelessWidget {
  const RecentInterviewsSection({super.key, required this.interviews, this.interview});

  final List<InterviewHistoryItemEntity>? interview;
  final List<InterviewEntity> interviews;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(AppSpacing.s16),
      sliver: SliverMainAxisGroup(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Recent Interviews',
                      style: AppTextStyle.bold(
                        size: 20,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: (){
                        context.pushNamed(RouteNames.allInterview);
                      },
                      child: Text(
                        'View All',
                        style: AppTextStyle.regular(
                          size: 14,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(AppSpacing.s16),
              ],
            ),
          ),

          SliverList.separated(
            itemCount: interviews.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.s16),
                child: RecentInterviewItem(
                    interviews: interview![index],
                    interview: interviews[index]),
              );
            },
            separatorBuilder: (_, _) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
