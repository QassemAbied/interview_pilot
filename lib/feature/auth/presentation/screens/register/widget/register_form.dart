import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_pilot/core/routing/route_names.dart';
import 'package:interview_pilot/feature/auth/presentation/screens/register/widget/register_footer.dart';
import '../../../../../../core/constants/app_spac.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/utils/app_validator.dart';
import '../../../../../../core/utils/enum/request_status.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_snak_bar.dart';
import '../../../../../../core/widgets/app_text_field.dart';
import '../../../../../../core/widgets/spacing.dart';
import '../../../../domain/entities/auth_params.dart';
import '../../../controller/auth_cubit.dart';
import '../../../controller/auth_state.dart';
import '../../common_widget/auth_bloc_listener.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();

    _nameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _passwordFocus.dispose();

    super.dispose();
  }

  void _register() {
    if (!_formKey.currentState!.validate()) return;

    context.read<AuthCubit>().signUp(
      AuthParams(
        _emailController.text.trim(),
        _passwordController.text.trim(),
        _nameController.text.trim(),

        null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthBlocListener(
      onSuccess: () async {
        AppSnackBar.success(context, message: 'Account created successfully');
        context.goNamed(RouteNames.login);
      },

      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                AppTextField(
                  controller: _nameController,
                  focusNode: _nameFocus,
                  nextFocusNode: _emailFocus,
                  hintText: 'Enter your name',
                  labelText: 'Full Name',
                  validator: AppValidator.name,
                  prefixIcon: const Icon(
                    Icons.person_outline,
                    color: AppColors.textSecondary,
                  ),
                ),

                verticalSpace(AppSpacing.s20),

                AppTextField(
                  controller: _emailController,
                  focusNode: _emailFocus,
                  nextFocusNode: _phoneFocus,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  validator: AppValidator.email,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColors.textSecondary,
                  ),
                ),

                verticalSpace(AppSpacing.s20),

                AppTextField(
                  controller: _phoneController,
                  focusNode: _phoneFocus,
                  nextFocusNode: _passwordFocus,
                  keyboardType: TextInputType.phone,
                  hintText: 'Enter your phone',
                  labelText: 'Phone',
                  validator: AppValidator.phone,
                  prefixIcon: const Icon(
                    Icons.phone_outlined,
                    color: AppColors.textSecondary,
                  ),
                ),

                verticalSpace(AppSpacing.s20),

                AppTextField(
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  obscureText: true,
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  validator: AppValidator.password,
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.textSecondary,
                  ),
                  onSubmitted: (_) => _register(),
                ),

                verticalSpace(AppSpacing.s32),

                AppButton(
                  title: 'Create Account',
                  isLoading: state.status == RequestStatus.loading,
                  onPressed: _register,
                ),

                verticalSpace(AppSpacing.s24),

                const RegisterFooter(),
              ],
            ),
          );
        },
      ),
    );
  }
}
