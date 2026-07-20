import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/widgets/app_text_field.dart';

class JobDescriptionField extends StatelessWidget {
  const JobDescriptionField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      labelText: 'Job Description (Optional)',
      hintText: 'Paste the job description here...',
      maxLines: 6,
      prefixIcon: const Padding(
        padding: EdgeInsets.only(bottom: 90),
        child: Icon(Icons.description_outlined, color: AppColors.textSecondary),
      ),
    );
  }
}
