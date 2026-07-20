
import 'dart:ui';

class RecentInterviewModel {
  final String title;

  final String date;

  final int score;

  final VoidCallback onTap;

  const RecentInterviewModel({
    required this.title,
    required this.date,
    required this.score,
    required this.onTap,
  });
}
