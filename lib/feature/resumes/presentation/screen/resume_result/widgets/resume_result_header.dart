import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/spacing.dart';

class ResumeResultHeader extends StatelessWidget {
  const ResumeResultHeader({
    super.key,
    required this.fileName,
    required this.targetJob,
  });

  final String fileName;
  final String targetJob;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Resume Analysis Complete',
          style: AppTextStyle.bold(size: 24, color: AppColors.textPrimary),
        ),

        verticalSpace(8),

        Text(
          'Your resume has been analyzed successfully.',
          style: AppTextStyle.regular(size: 14, color: AppColors.textSecondary),
        ),

        verticalSpace(20),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: .06),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: .10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.description_outlined,
                  color: AppColors.primary,
                ),
              ),

              horizontalSpace(12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fileName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.semiBold(
                        size: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    verticalSpace(4),

                    Text(
                      'Target Role: $targetJob',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.regular(
                        size: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
