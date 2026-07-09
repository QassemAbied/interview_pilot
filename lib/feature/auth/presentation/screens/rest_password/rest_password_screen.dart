import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilot/feature/auth/presentation/screens/rest_password/widget/rest_password_from.dart';

import '../../../../../core/di/injection_container.dart';
import '../../controller/auth_cubit.dart';
import '../common_widget/auth_shell.dart';

class RestPasswordScreen extends StatelessWidget {
  const RestPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: AuthShell(
        title: 'Reset Password',
        subtitle: 'Enter your email address to reset your password.',
        child: RestPasswordFrom(),
      ),
    );
  }
}
