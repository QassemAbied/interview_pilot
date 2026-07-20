import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.inputFormatters,
    this.maxLines = 1,
    this.mainLines=1 ,
    this.readOnly = false,
    this.enabled = true,
    this.obscureText = false,
    this.textInputAction,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.autovalidateMode,
  });

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final FocusNode? nextFocusNode;

  final String? hintText;

  final String? labelText;

  final Widget? prefixIcon;

  final Widget? suffixIcon;

  final TextInputType? keyboardType;

  final FormFieldValidator<String>? validator;

  final ValueChanged<String>? onChanged;

  final ValueChanged<String>? onSubmitted;

  final List<TextInputFormatter>? inputFormatters;

  final int maxLines;
  final int mainLines ;

  final bool obscureText;

  final bool readOnly;

  final bool enabled;

  final bool autofocus;

  final TextCapitalization textCapitalization;

  final AutovalidateMode? autovalidateMode;

  final TextInputAction? textInputAction;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool obscure;

  @override
  void initState() {
    super.initState();
    obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,

      focusNode: widget.focusNode,

      keyboardType: widget.keyboardType,

      autofocus: widget.autofocus,

      textCapitalization: widget.textCapitalization,

      autovalidateMode: widget.autovalidateMode,

      textInputAction:
          widget.textInputAction ??
          (widget.nextFocusNode == null
              ? TextInputAction.done
              : TextInputAction.next),

      obscureText: obscure,
      minLines: widget.mainLines,

      maxLines: widget.obscureText ? 1 : widget.maxLines,

      validator: widget.validator,

      readOnly: widget.readOnly,

      enabled: widget.enabled,

      inputFormatters: widget.inputFormatters,

      style: AppTextStyle.medium(size: 15, color: AppColors.textPrimary),

      onChanged: widget.onChanged,

      onFieldSubmitted: (value) {
        if (widget.nextFocusNode != null) {
          FocusScope.of(context).requestFocus(widget.nextFocusNode);
        } else {
          FocusScope.of(context).unfocus();
        }

        widget.onSubmitted?.call(value);
      },

      decoration: InputDecoration(
        hintText: widget.hintText,

        labelText: widget.labelText,

        hintStyle: AppTextStyle.regular(size: 14, color: AppColors.textHint),

        labelStyle: AppTextStyle.regular(
          size: 14,
          color: AppColors.textSecondary,
        ),

        prefixIcon: widget.prefixIcon,

        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                icon: Icon(
                  obscure
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  color: AppColors.textSecondary,
                ),
              )
            : widget.suffixIcon,
      ),
    );
  }
}
