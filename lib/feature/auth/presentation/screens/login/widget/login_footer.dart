import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants/app_spac.dart';
import '../../../../../../core/routing/route_names.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/spacing.dart';


class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: AppTextStyle.regular(
            size: 14,
            color: AppColors.textSecondary,
          ),
        ),
        horizontalSpace(AppSpacing.s2),
        GestureDetector(
          onTap: () {
           context.pushNamed(RouteNames.register);
          },
          child: Text(
            "Sign Up",
            style: AppTextStyle.semiBold(
              size: 14,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}