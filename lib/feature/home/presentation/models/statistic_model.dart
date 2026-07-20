import 'package:flutter/material.dart';

class StatisticModel {
  final String title;

  final String value;

  final IconData icon;

  final Color color;

  const StatisticModel({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });
}
