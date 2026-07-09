import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/routing/app_router.dart';
import '../core/routing/route_names.dart';
import '../core/theme/app_theme.dart';
import '../core/utils/enum/request_status.dart';
import 'app_cubit/app_cubit.dart';
import 'app_cubit/app_state.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        switch (state.status) {
          case AppStatus.authenticated:
            AppRouter.router.goNamed(RouteNames.home);
            break;

          case AppStatus.unauthenticated:
            AppRouter.router.goNamed(RouteNames.login);
            break;

          case AppStatus.passwordRecovery:
            AppRouter.router.goNamed(RouteNames.restPassword);
            break;

          default:
            break;
        }
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
