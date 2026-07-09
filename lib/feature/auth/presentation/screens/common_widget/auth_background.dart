import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.neutral50, AppColors.white],
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
