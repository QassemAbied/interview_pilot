import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/utils/enum/interview_enum.dart';
import '../../data/model/create_interview_model.dart';
import '../../domain/entities/create_interview_entity.dart';

class CreateInterviewMapper {
  static CreateInterviewModel toModel(CreateInterviewEntity entity) {
    return CreateInterviewModel(
      userId: Supabase.instance.client.auth.currentUser!.id,
      jobTitle: entity.jobTitle,
      companyName: entity.companyName,
      jobDescription: entity.jobDescription,
      interviewType: entity.interviewType.name,
      level: entity.level.name,
      score: 0,
      duration: 0,
      status: InterviewStatus.inProgress.name,
      startedAt: DateTime.now(),
    );
  }
}
