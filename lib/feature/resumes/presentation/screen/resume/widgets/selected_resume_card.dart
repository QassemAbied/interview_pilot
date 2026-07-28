import 'package:flutter/material.dart';
import 'package:interview_pilot/core/widgets/app_icon_background.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../../../core/widgets/spacing.dart';

class SelectedResumeCard extends StatelessWidget {
  const SelectedResumeCard({
    super.key,
    required this.fileName,
    required this.fileSize,
    required this.onRemove,
  });

  final String fileName;
  final String fileSize;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return AppCard(
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
                      fileName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.semiBold(
                        size: 15,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    verticalSpace(6),

                    Text(
                      'PDF • $fileSize',
                      style: AppTextStyle.regular(
                        size: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              horizontalSpace(8),

              IconButton(
                onPressed: onRemove,
                tooltip: 'Remove resumes',
                icon: const Icon(
                  Icons.close_rounded,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),

          verticalSpace(18),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: .08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.check_circle_rounded,
                  size: 19,
                  color: AppColors.success,
                ),

                horizontalSpace(8),

                Text(
                  'Ready for analysis',
                  style: AppTextStyle.medium(
                    size: 13,
                    color: AppColors.success,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
