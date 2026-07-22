import '../../../interview/domain/mapper/interview_mapper.dart';
import '../../../interview_result/domain/mapper/interview_evaluation_mapper.dart';
import '../../data/models/interview_history_item_model.dart';
import '../entities/interview_history_item_entity.dart';

class InterviewHistoryMapper {
 static List<InterviewHistoryItemEntity> toListEntity(
    List<InterviewHistoryItemModel> models,
  ) {
    return models.map(toEntity).toList();
  }

 static InterviewHistoryItemEntity toEntity(InterviewHistoryItemModel model) {
    return InterviewHistoryItemEntity(
      interview: InterviewMapper.toEntity(model.interview),
      evaluation: InterviewEvaluationModelMapper.toEntity(model.evaluation),
    );
  }
}
