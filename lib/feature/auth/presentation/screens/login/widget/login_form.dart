import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_pilot/feature/auth/presentation/screens/common_widget/auth_bloc_listener.dart';
import '../../../../../../core/constants/app_spac.dart';
import '../../../../../../core/routing/route_names.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/utils/app_validator.dart';
import '../../../../../../core/utils/enum/request_status.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_text_field.dart';
import '../../../../../../core/widgets/spacing.dart';
import '../../../../domain/entities/auth_params.dart';
import '../../../controller/auth_cubit.dart';
import '../../../controller/auth_state.dart';
import 'login_footer.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _emailFocus = FocusNode();

  final _passwordFocus = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    _emailFocus.dispose();
    _passwordFocus.dispose();

    super.dispose();
  }

  void _login() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.read<AuthCubit>().signIn(
      AuthParams(
        _emailController.text,
        _passwordController.text,
        null,
        null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthBlocListener(
      onSuccess: () {
        context.pop();
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppTextField(
                  controller: _emailController,
                  focusNode: _emailFocus,
                  nextFocusNode: _passwordFocus,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  hintText: "Enter your email",
                  labelText: "Email",
                  validator: AppValidator.email,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColors.textSecondary,
                  ),
                ),

                verticalSpace(AppSpacing.s20),

                AppTextField(
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  hintText: "Enter your password",
                  labelText: "Password",
                  validator: AppValidator.password,
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.textSecondary,
                  ),
                  onSubmitted: (_) => _login(),
                ),
                verticalSpace(AppSpacing.s12),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.pushNamed(RouteNames.forgetPassword);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: AppTextStyle.medium(
                        size: 14,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                verticalSpace(AppSpacing.s24),
                AppButton(
                  title: "Login",
                  isLoading: state.status == RequestStatus.loading,
                  onPressed: _login,
                ),
                verticalSpace(AppSpacing.s32),
                const LoginFooter(),
              ],
            ),
          );
        },
      ),
    );
  }
}
