import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors._();

  /// Brand
  static const Color primary = Color(0xFF5B5FEF);
  static const Color primaryLight = Color(0xFF8185FF);
  static const Color primaryDark = Color(0xFF4649D8);

  static const Color accent = Color(0xFF7C3AED);

  /// Background
  static const Color scaffold = Color(0xFFF8FAFC);
  static const Color background = Color(0xFFFFFFFF);
  static const Color card = Color(0xFFFFFFFF);

  /// Surface
  static const Color surface = Color(0xFFF1F5F9);
  static const Color divider = Color(0xFFE2E8F0);
  static const Color border = Color(0xFFE2E8F0);

  /// Text
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF475569);
  static const Color textHint = Color(0xFF94A3B8);

  /// Status
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF0EA5E9);

  /// Neutral
  static const Color neutral900 = Color(0xFF0F172A);
  static const Color neutral800 = Color(0xFF1E293B);
  static const Color neutral700 = Color(0xFF334155);
  static const Color neutral600 = Color(0xFF475569);
  static const Color neutral500 = Color(0xFF64748B);
  static const Color neutral400 = Color(0xFF94A3B8);
  static const Color neutral300 = Color(0xFFCBD5E1);
  static const Color neutral200 = Color(0xFFE2E8F0);
  static const Color neutral100 = Color(0xFFF1F5F9);
  static const Color neutral50 = Color(0xFFF8FAFC);

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;
}