import 'package:flutter/material.dart';
import 'package:interview_pilot/core/theme/app_colors.dart';
import 'package:interview_pilot/core/widgets/app_radius.dart';

import '../../../../../core/theme/app_text_styles.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.logout_rounded, color: AppColors.error),
      label: Text(
        'Logout',
        style: AppTextStyle.semiBold(size: 16, color: AppColors.error),
      ),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 58),
        side: const BorderSide(color: AppColors.error),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.br16),
      ),
    );
  }
}
