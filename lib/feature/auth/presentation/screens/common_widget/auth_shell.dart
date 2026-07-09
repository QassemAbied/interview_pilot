import 'package:flutter/material.dart';
import 'package:interview_pilot/core/widgets/spacing.dart';
import '../../../../../core/constants/app_spac.dart';
import 'auth_background.dart';
import 'auth_card.dart';
import 'auth_logo.dart';
import 'auth_title.dart';

class AuthShell extends StatelessWidget {
  const AuthShell({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AuthLogo(),

                 verticalSpace( AppSpacing.s20),

                AuthTitle(title: title, subtitle: subtitle),

                 verticalSpace( AppSpacing.s20),

                AuthCard(child: child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
