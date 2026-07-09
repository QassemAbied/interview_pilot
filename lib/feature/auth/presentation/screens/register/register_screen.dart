import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilot/feature/auth/presentation/screens/register/widget/register_form.dart';
import '../../../../../core/di/injection_container.dart';
import '../../controller/auth_cubit.dart';
import '../common_widget/auth_shell.dart';



class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: AuthShell(
        title: 'Create Account',
        subtitle: 'Start practicing interviews with AI today.',
        child: RegisterForm(),
      ),
    );
  }
}