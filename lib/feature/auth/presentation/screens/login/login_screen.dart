import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilot/feature/auth/presentation/controller/auth_cubit.dart';
import 'package:interview_pilot/feature/auth/presentation/screens/login/widget/login_form.dart';

import '../../../../../core/di/injection_container.dart';
import '../common_widget/auth_shell.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: AuthShell(
        title: 'Welcome Back',
        subtitle: 'Practice smarter with AI-powered interviews.',
        child: LoginForm(),
      ),
    );
  }
}