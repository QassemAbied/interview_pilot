import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../../domain/entities/interview_history_item_entity.dart';

class InterviewHistoryCard extends StatelessWidget {
  const InterviewHistoryCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  final InterviewHistoryItemEntity item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final interview = item.interview;
    final evaluation = item.evaluation;

    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      interview.jobTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.bold(
                        size: 18,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    if (interview.companyName != null &&
                        interview.companyName!.trim().isNotEmpty) ...[
                      verticalSpace(5),

                      Text(
                        interview.companyName!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.regular(
                          size: 13,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              horizontalSpace(12),

              _ScoreBadge(score: evaluation.overallScore),
            ],
          ),

          verticalSpace(18),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _InfoChip(
                icon: Icons.psychology_alt_outlined,
                text: interview.interviewType.name,
              ),

              _InfoChip(
                icon: Icons.signal_cellular_alt_rounded,
                text: interview.level.name,
              ),
            ],
          ),

          verticalSpace(18),

          const Divider(height: 1, color: AppColors.divider),

          verticalSpace(16),

          Row(
            children: [
              Expanded(
                child: Wrap(
                  spacing: 16,
                  runSpacing: 8,
                  children: [
                    _MetaItem(
                      icon: Icons.calendar_today_outlined,
                      text: DateFormat(
                        'MMM dd, yyyy',
                      ).format(interview.createdAt),
                    ),

                    _MetaItem(
                      icon: Icons.schedule_rounded,
                      text: '${interview.duration} min',
                    ),
                  ],
                ),
              ),
            ],
          ),

          verticalSpace(18),

          Row(
            children: [
              Text(
                'View Report',
                style: AppTextStyle.semiBold(
                  size: 14,
                  color: AppColors.primary,
                ),
              ),

              horizontalSpace(6),

              const Icon(
                Icons.arrow_forward_rounded,
                size: 18,
                color: AppColors.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ScoreBadge extends StatelessWidget {
  const _ScoreBadge({required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    final color = _scoreColor(score);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .10),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: .20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('$score', style: AppTextStyle.bold(size: 18, color: color)),

          Text('/100', style: AppTextStyle.medium(size: 10, color: color)),
        ],
      ),
    );
  }

  Color _scoreColor(int score) {
    if (score >= 90) {
      return AppColors.success;
    }

    if (score >= 80) {
      return AppColors.primary;
    }

    if (score >= 70) {
      return AppColors.warning;
    }

    return AppColors.error;
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: .07),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: AppColors.primary),

          horizontalSpace(6),

          Text(
            text,
            style: AppTextStyle.medium(
              size: 12,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _MetaItem extends StatelessWidget {
  const _MetaItem({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 15, color: AppColors.textHint),

        horizontalSpace(6),

        Text(
          text,
          style: AppTextStyle.regular(size: 12, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
