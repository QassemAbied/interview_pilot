import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilot/core/widgets/spacing.dart';

import '../../../../../../core/constants/app_spac.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/utils/app_validator.dart';
import '../../../../../../core/utils/enum/request_status.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_snak_bar.dart';
import '../../../../../../core/widgets/app_text_field.dart';
import '../../../controller/auth_cubit.dart';
import '../../../controller/auth_state.dart';
import '../../common_widget/auth_bloc_listener.dart';

class ForgetPasswordFrom extends StatefulWidget {
  const ForgetPasswordFrom({super.key});

  @override
  State<ForgetPasswordFrom> createState() => _ForgetPasswordFromState();
}

class _ForgetPasswordFromState extends State<ForgetPasswordFrom> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _emailFocus = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  void _forgetPassword() {
    if (!_formKey.currentState!.validate()) return;
    context.read<AuthCubit>().forgotPassword(_emailController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return AuthBlocListener(
      onSuccess: () {
        AppSnackBar.success(context, message: 'Password reset email sent successfully! Please check your inbox.');
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                verticalSpace(AppSpacing.s20),
                AppTextField(
                  controller: _emailController,
                  focusNode: _emailFocus,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  validator: AppValidator.email,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColors.textSecondary,
                  ),
                  onSubmitted: (_) => _forgetPassword(),
                ),
                verticalSpace(AppSpacing.s20),
                AppButton(
                    title: 'Reset Password',
                    onPressed: _forgetPassword,
                    isLoading: state.status==RequestStatus.loading
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
