import 'package:flutter/material.dart';
import 'package:interview_pilot/feature/auth/presentation/screens/register/widget/register_form.dart';
import '../common_widget/auth_shell.dart';



class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthShell(
      title: 'Create Account',
      subtitle: 'Start practicing interviews with AI today.',
      child: RegisterForm(),
    );
  }
}