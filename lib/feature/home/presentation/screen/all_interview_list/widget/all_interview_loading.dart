import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../interview/domain/entities/interview_entity.dart';
import '../all_interview_body.dart';

class  AllInterviewLoading extends StatelessWidget {
  const  AllInterviewLoading({super.key});

  @override
  Widget build(BuildContext context) {

    return Skeletonizer(
      enabled: true,

      child: AllInterviewBody(interviews: InterviewEntity.dummyList),);
  }
}
