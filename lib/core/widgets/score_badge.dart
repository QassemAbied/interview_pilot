import 'package:flutter/material.dart';
import '../helpers/interview_score_helper.dart';
import '../theme/app_text_styles.dart';

class ScoreBadge extends StatelessWidget {
  const ScoreBadge({super.key, required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    final color = InterviewScoreHelper.getScoreColor(score);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: .20)),
      ),
      child: Text('$score%', style: AppTextStyle.bold(size: 15, color: color)),
    );
  }

}
