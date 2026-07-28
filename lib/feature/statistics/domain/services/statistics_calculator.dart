import '../../../../core/helpers/score_helper.dart';
import '../../../history/domain/entities/interview_history_item_entity.dart';
import '../../../interview_result/domain/entities/technical_scores_entity.dart';
import '../entities/performance_point_entity.dart';
import '../entities/skill_performance_entity.dart';
import '../entities/statistics_entity.dart';

class StatisticsCalculator {
  const StatisticsCalculator();

  StatisticsEntity calculate(List<InterviewHistoryItemEntity> history) {
    if (history.isEmpty) {
      return _emptyStatistics();
    }

    final totalInterviews = history.length;

    final averageScore = ScoreHelper.calculateAverageScore(history);

    final bestScore = ScoreHelper.calculateBestScore(history);

    final progressPercentage = _calculateProgress(history);

    final averageTechnicalScores = _calculateAverageTechnicalScores(history);

    final performanceHistory = _buildPerformanceHistory(history);

    // نحول متوسط الـ Technical Scores
    // إلى List من المهارات عشان نعرف أعلى وأقل Skill.
    final skills = _buildSkills(averageTechnicalScores);

    final strongestSkill = _getStrongestSkill(skills);

    final focusArea = _getFocusArea(skills);

    return StatisticsEntity(
      totalInterviews: totalInterviews,
      averageScore: averageScore,
      bestScore: bestScore,
      progressPercentage: progressPercentage,
      averageTechnicalScores: averageTechnicalScores,
      performanceHistory: performanceHistory,
      strongestSkill: strongestSkill,
      focusArea: focusArea,
    );
  }

  TechnicalScoresEntity _calculateAverageTechnicalScores(
    List<InterviewHistoryItemEntity> history,
  ) {
    var flutter = 0;
    var architecture = 0;
    var problemSolving = 0;
    var communication = 0;
    var confidence = 0;

    for (final item in history) {
      final scores = item.evaluation.technicalScores;

      flutter += scores.flutter;
      architecture += scores.architecture;
      problemSolving += scores.problemSolving;
      communication += scores.communication;
      confidence += scores.confidence;
    }

    final count = history.length;

    return TechnicalScoresEntity(
      flutter: (flutter / count).round(),
      architecture: (architecture / count).round(),
      problemSolving: (problemSolving / count).round(),
      communication: (communication / count).round(),
      confidence: (confidence / count).round(),
    );
  }

  List<PerformancePointEntity> _buildPerformanceHistory(
    List<InterviewHistoryItemEntity> history,
  ) {
    final sortedHistory = List<InterviewHistoryItemEntity>.from(history)
      ..sort((a, b) => a.interview.createdAt.compareTo(b.interview.createdAt));

    return sortedHistory.map((item) {
      return PerformancePointEntity(
        score: item.evaluation.overallScore,
        date: item.interview.createdAt,
      );
    }).toList();
  }

  double _calculateProgress(List<InterviewHistoryItemEntity> history) {
    if (history.length < 2) {
      return 0;
    }

    final sortedHistory = List<InterviewHistoryItemEntity>.from(history)
      ..sort((a, b) => a.interview.createdAt.compareTo(b.interview.createdAt));

    final previousScore =
        sortedHistory[sortedHistory.length - 2].evaluation.overallScore;

    final currentScore = sortedHistory.last.evaluation.overallScore;

    if (previousScore == 0) {
      return 0;
    }

    return ((currentScore - previousScore) / previousScore) * 100;
  }

  List<SkillPerformanceEntity> _buildSkills(TechnicalScoresEntity scores) {
    return [
      SkillPerformanceEntity(name: 'Flutter', score: scores.flutter),
      SkillPerformanceEntity(name: 'Architecture', score: scores.architecture),
      SkillPerformanceEntity(
        name: 'Problem Solving',
        score: scores.problemSolving,
      ),
      SkillPerformanceEntity(
        name: 'Communication',
        score: scores.communication,
      ),
      SkillPerformanceEntity(name: 'Confidence', score: scores.confidence),
    ];
  }

  SkillPerformanceEntity _getStrongestSkill(
    List<SkillPerformanceEntity> skills,
  ) {
    return skills.reduce((current, next) {
      return next.score > current.score ? next : current;
    });
  }

  SkillPerformanceEntity _getFocusArea(List<SkillPerformanceEntity> skills) {
    return skills.reduce((current, next) {
      return next.score < current.score ? next : current;
    });
  }

  StatisticsEntity _emptyStatistics() {
    return const StatisticsEntity(
      totalInterviews: 0,
      averageScore: 0,
      bestScore: 0,
      progressPercentage: 0,
      averageTechnicalScores: TechnicalScoresEntity(
        flutter: 0,
        architecture: 0,
        problemSolving: 0,
        communication: 0,
        confidence: 0,
      ),
      performanceHistory: [],
      strongestSkill: SkillPerformanceEntity(name: '', score: 0),
      focusArea: SkillPerformanceEntity(name: '', score: 0),
    );
  }
}
