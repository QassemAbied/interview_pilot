import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_text_field.dart';
import '../../../../../../core/widgets/spacing.dart';

class ResumeAnalysisForm extends StatelessWidget {
  const ResumeAnalysisForm({
    super.key,
    required this.targetJobController,
    required this.jobDescriptionController,
    required this.onAnalyze,
    this.isAnalyzeEnabled = true,
    this.isLoading = false,
  });

  final TextEditingController targetJobController;
  final TextEditingController jobDescriptionController;
  final bool isLoading;
  final VoidCallback onAnalyze;

  final bool isAnalyzeEnabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(title: 'Target Job', requiredField: true),

        verticalSpace(8),

        AppTextField(
          controller: targetJobController,
          hintText: 'e.g. Flutter Developer',
          prefixIcon: Icon(Icons.work_outline_rounded),
        ),

        verticalSpace(24),

        Row(
          children: [
            Text(
              'Job Description',
              style: AppTextStyle.semiBold(
                size: 14,
                color: AppColors.textPrimary,
              ),
            ),

            horizontalSpace(8),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Optional',
                style: AppTextStyle.medium(
                  size: 11,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),

        verticalSpace(8),

        AppTextField(
          controller: jobDescriptionController,
          hintText: 'Paste the job description here...',
          maxLines: 6,
        ),

        verticalSpace(8),

        Text(
          'Adding a job description helps AI provide more accurate job-specific feedback.',
          style: AppTextStyle.regular(
            size: 12,
            height: 1.5,
            color: AppColors.textSecondary,
          ),
        ),

        verticalSpace(28),

        AppButton(
          title: 'Analyze resumes',
          isLoading: isLoading,
          onPressed: isAnalyzeEnabled ? onAnalyze : null,
        ),
      ],
    );
  }

  Widget _buildLabel({required String title, bool requiredField = false}) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyle.semiBold(size: 14, color: AppColors.textPrimary),
        ),

        if (requiredField) ...[
          horizontalSpace(4),

          Text('*', style: AppTextStyle.bold(size: 14, color: AppColors.error)),
        ],
      ],
    );
  }
}
