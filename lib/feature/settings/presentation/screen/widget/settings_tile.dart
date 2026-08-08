import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_pilot/core/theme/app_colors.dart';
import 'package:interview_pilot/core/widgets/app_icon_background.dart';
import 'package:interview_pilot/core/widgets/app_radius.dart';
import 'package:interview_pilot/core/widgets/spacing.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../models/setting_item.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({super.key, required this.item});

  final SettingItem item;

  @override
  Widget build(BuildContext context) {
    final iconColor = item.resolveIconColor(AppColors.primary, AppColors.error);

    final textColor = item.isDestructive
        ? AppColors.error
        : AppColors.textPrimary;

    return Opacity(
      opacity: item.isEnabled ? 1 : .45,
      child: IgnorePointer(
        ignoring: !item.isEnabled,
        child: Column(
          children: [
            InkWell(
              borderRadius: AppRadius.br16,
              onTap: () {
                if (item.onTap != null) {
                  item.onTap!.call();
                  return;
                }

                if (item.routeName != null) {
                  context.pushNamed(item.routeName!);
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    AppIconBackground(icon: item.icon, color: iconColor),

                    horizontalSpace(16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: AppTextStyle.semiBold(
                              size: 15,
                              color: textColor,
                            ),
                          ),

                          if (item.subtitle != null) ...[
                            verticalSpace(4),

                            Text(
                              item.subtitle!,
                              style: AppTextStyle.regular(
                                size: 13,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),

                    item.trailing ??
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: AppColors.textHint,
                        ),
                  ],
                ),
              ),
            ),

            if (item.showDivider)
              const Divider(indent: 72, height: 1, color: AppColors.divider),
          ],
        ),
      ),
    );
  }
}
