import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_shadow.dart';
import '../../../../../core/widgets/app_radius.dart';

class AuthCard extends StatelessWidget {
  const AuthCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 30, left: 24, right: 24),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: AppRadius.br20,
        boxShadow: AppShadow.heavy,
      ),
      child: child,
    );
  }
}
