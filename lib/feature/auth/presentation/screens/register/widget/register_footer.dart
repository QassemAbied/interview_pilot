import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/constants/app_spac.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/spacing.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: AppTextStyle.regular(size: 14, color: AppColors.textSecondary),
        ),
        horizontalSpace(AppSpacing.s8),
        GestureDetector(
          onTap: () => context.pop(),
          child: Text(
            'Login',
            style: AppTextStyle.semiBold(size: 14, color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
