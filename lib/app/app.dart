import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/di/injection_container.dart';
import '../feature/auth/presentation/controller/auth_cubit.dart';
import 'app_cubit/app_cubit.dart';
import 'app_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AppCubit>()..init()),
        BlocProvider(create: (_) => sl<AuthCubit>()),
      //  BlocProvider(create: (_) => sl<SetupCubit>()),
      ],
      child: const AppView(),
    );
  }
}
