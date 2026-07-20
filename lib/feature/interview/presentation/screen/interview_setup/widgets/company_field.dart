import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/widgets/app_text_field.dart';

class CompanyField extends StatelessWidget {
  const CompanyField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      labelText: 'Company (Optional)',
      hintText: 'Google',
      prefixIcon: const Icon(
        Icons.business_outlined,
        color: AppColors.textSecondary,
      ),
    );
  }
}
