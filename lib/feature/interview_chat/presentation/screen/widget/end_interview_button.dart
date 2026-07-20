import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_dialog.dart';

class EndInterviewButton extends StatelessWidget {
  const EndInterviewButton({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        AppDialog.show(
          context: context,
          title: 'End Interview',
          message: 'Are you sure you want to end this interview?',
          buttonText: 'End',
          onConfirm: onPressed,
        );
      },
      icon: FittedBox(
          fit: BoxFit.scaleDown,
          child: Icon(Icons.stop_circle_outlined, )),
      label: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          'Finish ',
          style: AppTextStyle.semiBold(size: 14, color: AppColors.primary),
        ),
      ),
    );
  }
}
