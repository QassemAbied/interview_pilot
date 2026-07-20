import 'package:flutter/material.dart';
import 'package:interview_pilot/core/widgets/app_radius.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

final class AppDialog {
  const AppDialog._();

  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    String buttonText = "OK",
    VoidCallback? onConfirm,
  }) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: AppRadius.br20),
          title: Text(
            title,
            style: AppTextStyle.bold(size: 18, color: AppColors.textPrimary),
          ),
          content: Text(
            message,
            style: AppTextStyle.regular(
              size: 14,
              color: AppColors.textSecondary,
            ),
          ),
          actions: [
            TextButton(
              onPressed:  onConfirm,
              child: Text(
                buttonText,
                style: AppTextStyle.semiBold(
                  size: 15,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<void> showCircle(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
