import 'package:flutter/material.dart';

abstract final class AppShadow {
  AppShadow._();

  static const List<BoxShadow> light = [
    BoxShadow(color: Color(0x12000000), blurRadius: 6, offset: Offset(0, 2)),
  ];

  static const List<BoxShadow> medium = [
    BoxShadow(color: Color(0x18000000), blurRadius: 12, offset: Offset(0, 6)),
  ];

  static const List<BoxShadow> heavy = [
    BoxShadow(color: Color(0x22000000), blurRadius: 20, offset: Offset(0, 10)),
  ];
}
