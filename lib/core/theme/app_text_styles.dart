import 'package:flutter/material.dart';

import 'font_weight_helper.dart';

abstract class AppTextStyle {
  const AppTextStyle._();

  static TextStyle light({
    required double size,
    required Color color,
    double? height,
  }) {
    return TextStyle(
      fontSize: size,
      color: color,
      height: height,
      fontWeight: FontWeightHelper.light,
    );
  }

  static TextStyle regular({
    required double size,
    required Color color,
    double? height,
  }) {
    return TextStyle(
      fontSize: size,
      color: color,
      height: height,
      fontWeight: FontWeightHelper.regular,
    );
  }

  static TextStyle medium({
    required double size,
    required Color color,
    double? height,
  }) {
    return TextStyle(
      fontSize: size,
      color: color,
      height: height,
      fontWeight: FontWeightHelper.medium,
    );
  }

  static TextStyle semiBold({
    required double size,
    required Color color,
    double? height,
  }) {
    return TextStyle(
      fontSize: size,
      color: color,
      height: height,
      fontWeight: FontWeightHelper.semiBold,
    );
  }

  static TextStyle bold({
    required double size,
    required Color color,
    double? height,
  }) {
    return TextStyle(
      fontSize: size,
      color: color,
      height: height,
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle extraBold({
    required double size,
    required Color color,
    double? height,
  }) {
    return TextStyle(
      fontSize: size,
      color: color,
      height: height,
      fontWeight: FontWeightHelper.extraBold,
    );
  }
}
