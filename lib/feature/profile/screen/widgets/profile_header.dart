import 'package:flutter/material.dart';
import 'package:interview_pilot/core/theme/app_colors.dart';
import 'package:interview_pilot/core/widgets/spacing.dart';
import 'package:interview_pilot/feature/auth/domain/entities/user_entity.dart';

import '../../../../core/theme/app_text_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.user,
    required this.onEditImage,
  });

  final UserEntity? user;
  final VoidCallback onEditImage;

  @override
  Widget build(BuildContext context) {
    final hasAvatar =
        user?.avatarUrl != null && user!.avatarUrl.trim().isNotEmpty;

    final firstLetter = (user?.name.isNotEmpty ?? false)
        ? user!.name.characters.first.toUpperCase()
        : '?';

    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 52,
              backgroundColor: AppColors.primary.withValues(alpha: .15),
              backgroundImage: hasAvatar ? NetworkImage(user!.avatarUrl) : null,
              child: !hasAvatar
                  ? Text(
                      firstLetter,
                      style: AppTextStyle.bold(
                        size: 34,
                        color: AppColors.primary,
                      ),
                    )
                  : null,
            ),

            InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: onEditImage,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(
                  Icons.camera_alt_rounded,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),

        verticalSpace(16),

        Text(
          user?.name ?? '',
          style: AppTextStyle.bold(size: 22, color: AppColors.textPrimary),
        ),

        verticalSpace(6),

        Text(
          user?.email ?? '',
          style: AppTextStyle.regular(size: 15, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
