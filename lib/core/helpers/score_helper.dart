
import '../../feature/history/domain/entities/interview_history_item_entity.dart';

class ScoreHelper {
  static int calculateBestScore(List<InterviewHistoryItemEntity> interviews) {
    if (interviews.isEmpty) {
      return 0;
    }

    return interviews
        .map((item) => item.evaluation.overallScore)
        .reduce((a, b) => a > b ? a : b);
  }

  static int calculateAverageScore(
    List<InterviewHistoryItemEntity> interviews,
  ) {
    if (interviews.isEmpty) {
      return 0;
    }

    final total = interviews.fold(0, (sum, item) {
      return sum + item.evaluation.overallScore;
    });
    return (total / interviews.length).round();
  }
  static int calculateSuccessInterview(List<InterviewHistoryItemEntity> interviews) {
    if (interviews.isEmpty) {
      return 0;
    }

   return interviews.where((item) => item.evaluation.overallScore >= 80).length;

  }
}
