import '../../domain/entities/analyze_resume_params.dart';
import '../models/resume_analysis_model.dart';

abstract class ResumeRemoteDataSource {
  Future<ResumeAnalysisModel> analyzeResume(AnalyzeResumeParams params);
  Future<List<ResumeAnalysisModel>> getAllAnalysis();
}
