import '../../data/models/resume_analysis_model.dart';
import '../entities/resume_analysis_entity.dart';

class ResumeAnalysisModelMapper {
  static ResumeAnalysisEntity toEntity(ResumeAnalysisModel model) {
    return ResumeAnalysisEntity(
      id: model.id,
      resumeFileName: model.resumeFileName,
      resumeFilePath: model.resumeFilePath,
      targetJob: model.targetJob,
      jobDescription: model.jobDescription,
      overallScore: model.overallScore,
      atsScore: model.atsScore,
      jobMatchScore: model.jobMatchScore,
      summary: model.summary,
      strengths: model.strengths,
      weaknesses: model.weaknesses,
      missingKeywords: model.missingKeywords,
      recommendations: model.recommendations,
      createdAt: model.createdAt,
    );
  }
}

class ResumeAnalysisEntityMapper {
  static ResumeAnalysisModel toModel(ResumeAnalysisEntity entity) {
    return ResumeAnalysisModel(
      id: entity.id,
      resumeFileName: entity.resumeFileName,
      resumeFilePath: entity.resumeFilePath,
      targetJob: entity.targetJob,
      jobDescription: entity.jobDescription,
      overallScore: entity.overallScore,
      atsScore: entity.atsScore,
      jobMatchScore: entity.jobMatchScore,
      summary: entity.summary,
      strengths: entity.strengths,
      weaknesses: entity.weaknesses,
      missingKeywords: entity.missingKeywords,
      recommendations: entity.recommendations,
      createdAt: entity.createdAt,
    );
  }
}
