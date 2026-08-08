import 'package:flutter/material.dart';
import 'package:interview_pilot/core/theme/app_colors.dart';
import 'package:interview_pilot/core/widgets/app_icon_background.dart';
import 'package:interview_pilot/core/widgets/app_radius.dart';
import 'package:interview_pilot/core/widgets/spacing.dart';
import '../../../../../core/theme/app_text_styles.dart';

class AiPersonalityBottomSheet extends StatelessWidget {
  const AiPersonalityBottomSheet({
    super.key,
    required this.selectedPersonality,
    required this.onSelected,
  });

  final String selectedPersonality;
  final ValueChanged<String> onSelected;

  static const List<String> personalities = [
    'Friendly',
    'Professional',
    'Senior Engineer',
    'Strict Interviewer',
    'Technical Interviewer',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.divider,
                    borderRadius: AppRadius.br20,
                  ),
                ),
              ),

              verticalSpace(24),

              Text(
                'AI Personality',
                style: AppTextStyle.bold(
                  size: 20,
                  color: AppColors.textPrimary,
                ),
              ),

              verticalSpace(6),

              Text(
                'Choose how the AI should behave during your interviews.',
                style: AppTextStyle.regular(
                  size: 14,
                  color: AppColors.textSecondary,
                ),
              ),

              verticalSpace(20),

              ...personalities.map((personality) {
                final isSelected = personality == selectedPersonality;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: InkWell(
                    borderRadius: AppRadius.br16,
                    onTap: () {
                      onSelected(personality);
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary.withValues(alpha: .08)
                            : AppColors.white,
                        borderRadius: AppRadius.br16,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.border,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              personality,
                              style: AppTextStyle.medium(
                                size: 15,
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.textPrimary,
                              ),
                            ),
                          ),

                          if (isSelected)
                            const Icon(
                              Icons.check_circle_rounded,
                              color: AppColors.primary,
                              size: 22,
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class AiCard extends StatefulWidget {
  const AiCard({super.key});

  @override
  State<AiCard> createState() => _AiCardState();
}

class _AiCardState extends State<AiCard> {
  String? aiPersonalities;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) {
            return AiPersonalityBottomSheet(
              selectedPersonality: aiPersonalities ?? 'Senior Engineer',
              onSelected: (value) {
                setState(() {
                  aiPersonalities = value;
                });
                debugPrint(value);
                debugPrint(aiPersonalities);
              },
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: AppRadius.br24,
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            AppIconBackground(
              color: AppColors.primary,
              icon: Icons.psychology_outlined,
            ),

            horizontalSpace(16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AI Personality',
                    style: AppTextStyle.bold(
                      size: 18,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  verticalSpace(4),

                  Text(
                    aiPersonalities ?? 'Senior Engineer',
                    style: AppTextStyle.regular(
                      size: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: AppColors.textHint,
            ),
          ],
        ),
      ),
    );
  }
}
