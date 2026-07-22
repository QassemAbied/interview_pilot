import 'package:interview_pilot/feature/interview_result/domain/mapper/technical_scores_mapper.dart';

import '../../data/models/interview_evaluation_model.dart';
import '../entities/interview_evaluation_entity.dart';

class InterviewEvaluationModelMapper {
 static InterviewEvaluationEntity toEntity(InterviewEvaluationModel model) {
    return InterviewEvaluationEntity(
      id: model.id,
      interviewId: model.interviewId,
      overallScore: model.overallScore,
      overallFeedback: model.overallFeedback,
      strengths: model.strengths,
      weaknesses: model.weaknesses,
      recommendations: model.recommendations,
      createdAt: model.createdAt,
      technicalScores: TechnicalScoresModelMapper.toEntity(
        model.technicalScores,
      ),
    );
  }
}

class InterviewEvaluationEntityMapper {
 static InterviewEvaluationModel toModel(InterviewEvaluationEntity entity) {
    return InterviewEvaluationModel(
      id: entity.id,
      interviewId: entity.interviewId,
      overallScore: entity.overallScore,
      overallFeedback: entity.overallFeedback,
      strengths: entity.strengths,
      weaknesses: entity.weaknesses,
      recommendations: entity.recommendations,
      createdAt: entity.createdAt,
      technicalScores: TechnicalScoresEntityMapper.toModel(
        entity.technicalScores,
      ),
    );
  }
}
