import '../../../../core/utils/enum/interview_enum.dart';
import '../../data/model/interview_model.dart';
import '../../domain/entities/interview_entity.dart';

class InterviewMapper {
  static List<InterviewEntity> toListEntity(List<InterviewModel> models) {
    return models.map(toEntity).toList();
  }

  static InterviewEntity toEntity(InterviewModel model) {
    return InterviewEntity(
      id: model.id,
      userId: model.userId,
      jobTitle: model.jobTitle,
      companyName: model.companyName,
      jobDescription: model.jobDescription,
      interviewType: InterviewType.values.byName(model.interviewType),
      level: ExperienceLevel.values.byName(model.level),
      score: model.score,
      duration: model.duration,
      status: InterviewStatus.values.byName(model.status),
      startedAt: model.startedAt,
      endedAt: model.endedAt,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  static InterviewModel toModel(InterviewEntity entity) {
    return InterviewModel(
      id: entity.id,
      userId: entity.userId,
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
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
