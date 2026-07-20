import 'package:flutter/material.dart';
import 'package:interview_pilot/core/utils/enum/interview_enum.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../interview/domain/entities/interview_entity.dart';
import '../../../domain/entities/dashboard_entity.dart';
import '../home_body.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: HomeBody(
        dashboard: DashboardEntity(
          totalInterviews: 20,
          averageScore: 90,
          bestScore: 97,
          successRate: 92,
          recentInterviews: List.generate(
            3,
            (index) => InterviewEntity(
              id: '$index',
              userId: '',
              jobTitle: 'Flutter Developer',
              companyName: 'Google',
              jobDescription: '',
              interviewType: InterviewType.behavioral,
              level: ExperienceLevel.junior,
              score: 90,
              duration: 1200,
              status: InterviewStatus.completed,
              startedAt: DateTime.now(),
              endedAt: DateTime.now(),
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ),
          ),
        ),
      ),
    );
  }
}
