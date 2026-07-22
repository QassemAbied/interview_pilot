import '../../data/models/technical_scores_model.dart';
import '../../domain/entities/technical_scores_entity.dart';

class TechnicalScoresModelMapper
 {
 static TechnicalScoresEntity toEntity(TechnicalScoresModel model) {
    return TechnicalScoresEntity(
      flutter: model.flutter,
      architecture: model.architecture,
      problemSolving: model.problemSolving,
      communication: model.communication,
      confidence: model.confidence,
    );
  }
}

class TechnicalScoresEntityMapper {
 static TechnicalScoresModel toModel(TechnicalScoresEntity entity) {
    return TechnicalScoresModel(
      flutter: entity.flutter,
      architecture: entity.architecture,
      problemSolving: entity.problemSolving,
      communication: entity.communication,
      confidence: entity.confidence,
    );
  }
}