import 'package:flutter/material.dart';

import '../../../../../core/constants/app_spac.dart';
import '../../../../interview/domain/entities/interview_entity.dart';
import '../widget/recent_interview_item.dart';

class AllInterviewBody extends StatelessWidget {
  final List<InterviewEntity> interviews;

  const AllInterviewBody({super.key, required this.interviews});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(AppSpacing.s16),
          sliver: SliverList.separated(
            itemCount: interviews.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.s16),
                child: RecentInterviewItem(interview: interviews[index]),
              );
            },
            separatorBuilder: (_, _) => const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
