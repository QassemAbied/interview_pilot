import 'package:flutter/material.dart';
import 'package:interview_pilot/core/widgets/app_icon_background.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../../../core/widgets/spacing.dart';

class ResumeUploadCard extends StatelessWidget {
  const ResumeUploadCard({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          child: Column(
            children: [
              AppIconBackground(
                color: AppColors.primary,
                icon: Icons.upload_file_rounded,
              ),

              verticalSpace(18),

              Text(
                'Upload your resumes',
                textAlign: TextAlign.center,
                style: AppTextStyle.bold(
                  size: 18,
                  color: AppColors.textPrimary,
                ),
              ),

              verticalSpace(8),

              Text(
                'Upload your resumes to get AI-powered feedback',
                textAlign: TextAlign.center,
                style: AppTextStyle.regular(
                  size: 14,
                  height: 1.5,
                  color: AppColors.textSecondary,
                ),
              ),

              verticalSpace(16),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.neutral100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'PDF • Maximum 5 MB',
                  style: AppTextStyle.medium(
                    size: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),

              verticalSpace(20),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 11,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: .10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.folder_open_rounded,
                      size: 18,
                      color: AppColors.primary,
                    ),

                    horizontalSpace(8),

                    Text(
                      'Choose File',
                      style: AppTextStyle.semiBold(
                        size: 14,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
