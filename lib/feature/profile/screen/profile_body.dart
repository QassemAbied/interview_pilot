import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilot/feature/profile/screen/widgets/profile_header.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/enum/request_status.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/spacing.dart';
import '../../auth/domain/entities/update_params.dart';
import '../../auth/domain/entities/user_entity.dart';
import '../../auth/presentation/controller/auth_cubit.dart';
import '../../auth/presentation/controller/auth_state.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.user,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController bioController,
    required this.state,
  }) : _formKey = formKey,
       _nameController = nameController,
       _emailController = emailController,
       _bioController = bioController;

  final GlobalKey<FormState> _formKey;
  final UserEntity? user;
  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _bioController;
  final AuthState state;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ProfileHeader(user: user, onEditImage: () {}),

          verticalSpace(32),

          Text(
            "Personal Information",
            style: AppTextStyle.bold(size: 18, color: AppColors.textPrimary),
          ),

          verticalSpace(20),

          AppTextField(
            controller: _nameController,
            labelText: "Full Name",
            hintText: "Enter your full name",
            prefixIcon: const Icon(Icons.person_outline),
          ),
          verticalSpace(16),
          AppTextField(
            controller: _emailController,
            labelText: "Email",
            enabled: false,
            prefixIcon: const Icon(Icons.email_outlined),
          ),

          verticalSpace(16),
          AppTextField(
            controller: _bioController,
            labelText: "Bio",
            hintText: "Tell us about yourself",
            maxLines: 4,
          ),
          verticalSpace(32),
          AppButton(
            title: "Save Changes",
            isLoading: state.status == RequestStatus.loading,
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;
              context.read<AuthCubit>().updateUser(
                UpdateParams(
                  _nameController.text.trim(),
                  user?.avatarUrl,
                  _bioController.text.trim(),
                  '',
                ),
              );
            },
          ),

          verticalSpace(24),
        ],
      ),
    );
  }
}
