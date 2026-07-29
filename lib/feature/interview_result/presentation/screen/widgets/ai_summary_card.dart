import 'package:flutter/material.dart';
import 'package:interview_pilot/core/widgets/result_Section.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';


class AiSummaryCard extends StatelessWidget {
  const AiSummaryCard({super.key, required this.summary});

  final String summary;

  @override
  Widget build(BuildContext context) {
    return AppResultSection(
      title: "Summary",
      color: AppColors.primary,
      icon: Icons.auto_awesome_rounded,
      child: Text(
        summary,
        style: AppTextStyle.regular(
          size: 15,
          height: 1.7,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
