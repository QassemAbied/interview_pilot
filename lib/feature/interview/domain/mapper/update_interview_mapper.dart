import '../../data/model/update_interview_model.dart';
import '../../domain/entities/update_interview_entity.dart';

class UpdateInterviewMapper {
  static UpdateInterviewModel toModel(UpdateInterviewEntity entity) {
    return UpdateInterviewModel(
      id: entity.id,
      jobTitle: entity.jobTitle,
      companyName: entity.companyName,
      jobDescription: entity.jobDescription,
      interviewType: entity.interviewType.name,
      level: entity.level.name,
      score: entity.score,
      duration: entity.duration,
      status: entity.status.name,
      startedAt: entity.startedAt,
      endedAt: entity.endedAt,
      updatedAt: DateTime.now(),
    );
  }
}
