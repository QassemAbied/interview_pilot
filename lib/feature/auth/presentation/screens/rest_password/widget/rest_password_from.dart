import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_pilot/feature/auth/presentation/screens/common_widget/auth_bloc_listener.dart';

import '../../../../../../core/constants/app_spac.dart';
import '../../../../../../core/routing/route_names.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/utils/app_validator.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_snak_bar.dart';
import '../../../../../../core/widgets/app_text_field.dart';
import '../../../../../../core/widgets/spacing.dart';
import '../../../controller/auth_cubit.dart';

class RestPasswordFrom extends StatefulWidget {
  const RestPasswordFrom({super.key});

  @override
  State<RestPasswordFrom> createState() => _RestPasswordFromState();
}

class _RestPasswordFromState extends State<RestPasswordFrom> {
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _passwordFocus = FocusNode();
  final _passwordConfirmFocus = FocusNode();

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordFocus.dispose();
    _passwordConfirmController.dispose();
    _passwordConfirmFocus.dispose();
    super.dispose();
  }

  void _confirmPassword() {
    if (!_formKey.currentState!.validate()) return;
    if (_passwordController.text != _passwordConfirmController.text) {
      AppSnackBar.error(context, message: 'Passwords do not match');
      return;
    }
    context.read<AuthCubit>().restPassword(_passwordController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return AuthBlocListener(
      onSuccess: () {
        AppSnackBar.success(context, message: 'Password reset successfully!');
        //context.pop();
        context.goNamed(RouteNames.login);
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            verticalSpace(AppSpacing.s20),
            AppTextField(
              controller: _passwordController,
              focusNode: _passwordFocus,
              nextFocusNode: _passwordConfirmFocus,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              hintText: 'Enter your password',
              labelText: 'Password',
              validator: AppValidator.password,
              prefixIcon: const Icon(
                Icons.lock_outline_rounded,
                color: AppColors.textSecondary,
              ),
            ),
            verticalSpace(AppSpacing.s20),
            AppTextField(
              controller: _passwordConfirmController,
              focusNode: _passwordConfirmFocus,
              obscureText: true,
              hintText: 'Enter your password again',
              labelText: 'Password',
              validator: AppValidator.password,
              prefixIcon: const Icon(
                Icons.lock_outline_rounded,
                color: AppColors.textSecondary,
              ),
              onSubmitted: (_) => _confirmPassword(),
            ),
            verticalSpace(AppSpacing.s20),
            AppButton(title: 'Reset Password', onPressed: _confirmPassword),
          ],
        ),
      ),
    );
  }
}
