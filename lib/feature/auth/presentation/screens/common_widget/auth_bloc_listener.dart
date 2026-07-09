import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/enum/request_status.dart';
import '../../../../../core/widgets/app_snak_bar.dart';
import '../../controller/auth_cubit.dart';
import '../../controller/auth_state.dart';

class AuthBlocListener extends StatelessWidget {
  const AuthBlocListener({
    super.key,
    required this.child,
    this.onSuccess,
  });

  final Widget child;
  final VoidCallback? onSuccess;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == RequestStatus.success) {
          onSuccess?.call();
        }

        if (state.status == RequestStatus.error) {
          AppSnackBar.error(
            context,
            message: state.errorMessage ?? 'Something went wrong',
          );
        }
      },
      child: child,
    );
  }
}