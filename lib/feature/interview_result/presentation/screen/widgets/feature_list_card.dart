import 'package:flutter/material.dart';
import 'package:interview_pilot/core/widgets/result_Section.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/spacing.dart';

class FeatureListCard extends StatelessWidget {
  const FeatureListCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.items,
  });

  final String title;
  final IconData icon;
  final Color color;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return AppResultSection(
      title: title,
      icon: icon,
      color: color,
      child: Column(
        children: items
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check_circle_rounded, color: color, size: 20),

                    horizontalSpace(12),

                    Expanded(
                      child: Text(
                        item,
                        style: AppTextStyle.regular(
                          size: 15,
                          color: AppColors.textPrimary,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
