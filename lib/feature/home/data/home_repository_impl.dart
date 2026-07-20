import 'package:dartz/dartz.dart';
import '../../../core/error/Failure.dart';
import '../../../core/helpers/base_repository.dart';
import '../../interview/domain/interview_repository.dart';
import '../domain/entities/dashboard_entity.dart';
import '../domain/home_repository.dart';

class HomeRepositoryImpl extends BaseRepository implements HomeRepository {
  final InterviewRepository interviewRepository;

  HomeRepositoryImpl({required this.interviewRepository});

  @override
  Future<Either<Failure, DashboardEntity>> getDashboard() async {
    final result = await interviewRepository.getAllInterview();

    return result.fold(left, (interviews) {
      final totalInterviews = interviews.length;

      // final averageScore = interviews.isEmpty
      //     ? 0.0
      //     : interviews.map((e) => e.score).reduce((a, b) => a + b) /
      //           interviews.length;
      final totalScore = interviews.fold<int>(
        0,
            (sum, interview) => sum + interview.score,
      );

      final averageScore = interviews.isEmpty
          ? 0
          : totalScore / interviews.length;

      final bestScore = interviews.isEmpty
          ? 0
          : interviews.map((e) => e.score).reduce((a, b) => a > b ? a : b);

      final successCount = interviews.where((e) => e.score >= 70).length;

      final successRate = interviews.isEmpty
          ? 0.0
          : (successCount / interviews.length) * 100;

      // final recent = [...interviews]
      //   ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
      final recentInterviews = interviews
          .take(5)
          .toList();
      return right(
        DashboardEntity(
          totalInterviews: totalInterviews,
          averageScore: averageScore.toDouble(),
          bestScore: bestScore.toDouble(),
          successRate: successRate,
          recentInterviews: recentInterviews,
        ),
      );
    });
  }
}
