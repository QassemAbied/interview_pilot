import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(this.icon, {super.key});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: 22, color: AppColors.textSecondary);
  }
}
