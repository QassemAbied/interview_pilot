import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/app_radius.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key, this.size = 72});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: AppRadius.br24,
      ),
      child: Icon(
        Icons.psychology_alt_rounded,
        color: AppColors.white,
        size: size * .45,
      ),
    );
  }
}
