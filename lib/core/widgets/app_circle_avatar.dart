import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar({
    super.key,
    this.circleColor = AppColors.primary,
    this.iconColor = AppColors.primary,
    required this.icon,
  });
  final Color circleColor;
  final Color iconColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 26,
      backgroundColor: circleColor.withValues(alpha: .1),
      child: Icon(icon, color: iconColor),
    );
  }
}
