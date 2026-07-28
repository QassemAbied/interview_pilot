import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/routing/route_names.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../../../core/widgets/app_icon_background.dart';
import '../../../../../../core/widgets/score_badge.dart';
import '../../../../../../core/widgets/spacing.dart';
import '../../../../domain/entities/resume_analysis_entity.dart';

class AllResumeCv extends StatelessWidget {
  final List<ResumeAnalysisEntity> analysis;

  const AllResumeCv({super.key, required this.analysis});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GestureDetector(
            onTap: () {
              context.pushNamed(
                RouteNames.resumeResultAnalysis,
                extra: analysis[index],
              );
            },
            child: AppCard(
              child: Column(
                children: [
                  Row(
                    children: [
                      AppIconBackground(
                        color: AppColors.error,
                        icon: Icons.picture_as_pdf_rounded,
                      ),
                      horizontalSpace(14),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              analysis[index].resumeFileName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.semiBold(
                                size: 15,
                                color: AppColors.textPrimary,
                              ),
                            ),

                            verticalSpace(6),

                            Text(
                              DateFormat(
                                'y-MM-dd – kk:mm',
                              ).format(analysis[index].createdAt),
                              style: AppTextStyle.regular(
                                size: 13,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),

                      horizontalSpace(8),

                      ScoreBadge(score: analysis[index].overallScore),
                    ],
                  ),

                  verticalSpace(18),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => verticalSpace(10),
      itemCount: analysis.length,
    );
  }
}
