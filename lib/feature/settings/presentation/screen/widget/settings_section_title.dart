import 'package:flutter/material.dart';
import 'package:interview_pilot/core/theme/app_colors.dart';
import 'package:interview_pilot/core/widgets/app_radius.dart';
import 'package:interview_pilot/core/widgets/spacing.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../models/settings_section_model.dart';
import 'settings_tile.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key, required this.section});

  final SettingsSectionModel section;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          section.title.toUpperCase(),
          style: AppTextStyle.medium(size: 13, color: AppColors.textHint),
        ),

        verticalSpace(12),

        Container(
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: AppRadius.br24,
            border: Border.all(color: AppColors.border),
          ),
          child: ClipRRect(
            borderRadius: AppRadius.br24,
            child: Column(
              children: List.generate(
                section.items.length,
                (index) => SettingsTile(item: section.items[index]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
