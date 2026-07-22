import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../../domain/entities/technical_scores_entity.dart';
import 'ai_summary_card.dart';
import 'feature_list_card.dart';
import 'hero_report_card.dart';

class InterviewResultSkeleton extends StatelessWidget {
  const InterviewResultSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            HeroReportCard(score: 85, scores: _dummyScores),

            verticalSpace(24),

            const AiSummaryCard(
              summary:
                  "Lorem ipsum dolor sit amet consectetur adipiscing elit.",
            ),

            verticalSpace(24),

            FeatureListCard(
              title: "Strengths",
              icon: Icons.workspace_premium_rounded,
              color: AppColors.success,
              items: _dummyItems,
            ),

            verticalSpace(20),

            FeatureListCard(
              title: "Areas to Improve",
              icon: Icons.trending_up_rounded,
              color: AppColors.warning,
              items: _dummyItems,
            ),
          ],
        ),
      ),
    );
  }
}

const _dummyItems = [
  "Lorem ipsum dolor sit amet",
  "Lorem ipsum dolor sit amet",
  "Lorem ipsum dolor sit amet",
];

final _dummyScores = TechnicalScoresEntity(
  flutter: 90,
  architecture: 85,
  problemSolving: 80,
  communication: 75,
  confidence: 88,
);
