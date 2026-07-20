import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/widgets/app_text_field.dart';


class JobTitleField extends StatelessWidget {
  const JobTitleField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      labelText: 'Job Title',
      hintText: 'Flutter Developer',
     // validator: AppValidator.name(value),
      prefixIcon: const Icon(
        Icons.work_outline_rounded,
        color: AppColors.textSecondary,
      ),
    );
  }
}