import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilot/core/theme/app_colors.dart';
import 'package:interview_pilot/core/widgets/app_radius.dart';
import 'package:interview_pilot/core/widgets/spacing.dart';
import 'package:interview_pilot/feature/auth/domain/entities/user_entity.dart';
import 'package:interview_pilot/feature/auth/presentation/controller/auth_cubit.dart';
import 'package:interview_pilot/feature/auth/presentation/controller/auth_state.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/enum/request_status.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state.status == RequestStatus.loading) {
          return ProfileListTitle(user: UserEntity.dummy);
        }

        if (state.user == null) {
          return const SizedBox.shrink();
        }
        return ProfileListTitle(user: state.user);
      },
    );
  }
}

class ProfileListTitle extends StatelessWidget {
  const ProfileListTitle({super.key, required this.user});
  final UserEntity? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: AppRadius.br24,
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 34,
            backgroundColor: AppColors.primary.withValues(alpha: .08),
            backgroundImage:
                user?.avatarUrl != null && user!.avatarUrl.isNotEmpty
                ? NetworkImage(user!.avatarUrl)
                : null,
            child: user?.avatarUrl == null || user!.avatarUrl.isEmpty
                ? Text(
                    user!.name.substring(0, 1).toUpperCase(),
                    style: AppTextStyle.semiBold(
                      size: 24,
                      color: AppColors.primary,
                    ),
                  )
                : null,
          ),

          horizontalSpace(16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user!.name,
                  style: AppTextStyle.bold(
                    size: 18,
                    color: AppColors.textPrimary,
                  ),
                ),

                verticalSpace(4),

                Text(
                  user!.email,
                  style: AppTextStyle.regular(
                    size: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
