import 'package:flutter/material.dart';
import 'package:interview_pilot/feature/resumes/presentation/screen/resume_result/widgets/resume_feedback_card.dart';
import 'package:interview_pilot/feature/resumes/presentation/screen/resume_result/widgets/resume_missing_keywords_card.dart';
import 'package:interview_pilot/feature/resumes/presentation/screen/resume_result/widgets/resume_recommendations_card.dart';
import 'package:interview_pilot/feature/resumes/presentation/screen/resume_result/widgets/resume_result_header.dart';
import 'package:interview_pilot/feature/resumes/presentation/screen/resume_result/widgets/resume_score_overview_card.dart';
import 'package:interview_pilot/feature/resumes/presentation/screen/resume_result/widgets/resume_summary_card.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../../domain/entities/resume_analysis_entity.dart';

class ResumeResultBody extends StatelessWidget {
  final ResumeAnalysisEntity analysis;

  const ResumeResultBody({super.key, required this.analysis});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResumeResultHeader(
            fileName: analysis.resumeFileName,
            targetJob: analysis.targetJob,
          ),
          verticalSpace(24),

          ResumeScoreOverviewCard(
            overallScore: analysis.overallScore,
            atsScore: analysis.atsScore,
            jobMatchScore: analysis.jobMatchScore,
          ),
          verticalSpace(20),

          ResumeSummaryCard(summary: analysis.summary),
          verticalSpace(20),

          ResumeFeedbackCard(
            title: 'Strengths',
            items: analysis.strengths,
            icon: Icons.thumb_up_alt_outlined,
            color: AppColors.success,
          ),

          verticalSpace(20),

          ResumeFeedbackCard(
            title: 'Areas for Improvement',
            items: analysis.weaknesses,
            icon: Icons.trending_up_rounded,
            color: AppColors.warning,
          ),
          verticalSpace(20),

          if (analysis.missingKeywords.isNotEmpty)
            ResumeMissingKeywordsCard(keywords: analysis.missingKeywords),

          verticalSpace(20),
          if (analysis.recommendations.isNotEmpty)
            ResumeRecommendationsCard(
              recommendations: analysis.recommendations,
            ),
        ],
      ),
    );
  }
}
