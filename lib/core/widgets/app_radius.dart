import 'package:flutter/material.dart';

abstract class AppRadius {
  const AppRadius._();

  static const radius8 = Radius.circular(8);
  static const radius12 = Radius.circular(12);
  static const radius16 = Radius.circular(16);
  static const radius20 = Radius.circular(20);
  static const radius24 = Radius.circular(24);

  static const br8 = BorderRadius.all(radius8);
  static const br12 = BorderRadius.all(radius12);
  static const br16 = BorderRadius.all(radius16);
  static const br20 = BorderRadius.all(radius20);
  static const br24 = BorderRadius.all(radius24);
}