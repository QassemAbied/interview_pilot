import 'package:flutter/material.dart';

class AppIconBackground extends StatelessWidget {
  const AppIconBackground({super.key, required this.color, required this.icon});

  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: color.withValues(alpha: .10),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon, size: 26, color: color),
    );
  }
}
