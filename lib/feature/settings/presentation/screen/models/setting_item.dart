import 'package:flutter/material.dart';

class SettingItem {
  final String title;
  final String? subtitle;

  final IconData icon;

  final Color? iconColor;

  final Widget? trailing;

  final String? routeName;

  final VoidCallback? onTap;

  final bool showDivider;

  final bool isDestructive;

  final bool isEnabled;

  const SettingItem({
    required this.title,
    this.subtitle,
    required this.icon,
    this.iconColor,
    this.trailing,
    this.routeName,
    this.onTap,
    this.showDivider = true,
    this.isDestructive = false,
    this.isEnabled = true,
  });

  Color resolveIconColor(Color primary, Color error) {
    if (isDestructive) return error;
    return iconColor ?? primary;
  }
}