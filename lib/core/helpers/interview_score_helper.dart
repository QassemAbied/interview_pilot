import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

abstract class InterviewScoreHelper {
  const InterviewScoreHelper._();

  static Color getScoreColor(int score) {
    if (score >= 90) {
      return AppColors.success;
    }

    if (score >= 80) {
      return AppColors.primary;
    }

    if (score >= 70) {
      return AppColors.warning;
    }

    return AppColors.error;
  }

  static String getScoreTitle(int score) {
    if (score >= 90) {
      return 'Excellent';
    }

    if (score >= 80) {
      return 'Very Good';
    }

    if (score >= 70) {
      return 'Good';
    }

    if (score >= 60) {
      return 'Fair';
    }

    return 'Needs Improvement';
  }

  static String getScoreDescription(int score) {
    if (score >= 90) {
      return "Outstanding interview performance. Your technical knowledge, communication and confidence were excellent.";
    }

    if (score >= 80) {
      return "Very good interview performance. Continue practicing advanced topics to reach an excellent level.";
    }

    if (score >= 70) {
      return "Good overall performance. Focus on strengthening weak areas and improving consistency.";
    }

    if (score >= 60) {
      return "Fair performance. More interview practice and technical revision will significantly improve your results.";
    }

    return "You're at the beginning of your interview journey. Keep practicing and you'll improve quickly.";
  }

  static IconData getScoreIcon(int score) {
    if (score >= 90) {
      return Icons.verified_rounded;
    }

    if (score >= 80) {
      return Icons.thumb_up_alt_rounded;
    }

    if (score >= 70) {
      return Icons.trending_up_rounded;
    }

    return Icons.priority_high_rounded;
  }

  static String getScoreLabel(int score) {
    if (score >= 90) {
      return "Excellent";
    }

    if (score >= 80) {
      return "Very Good";
    }

    if (score >= 70) {
      return "Good";
    }

    return "Needs Improvement";
  }
}
