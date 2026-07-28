import 'package:dartz/dartz.dart';
import 'package:interview_pilot/core/error/Failure.dart';

import 'entities/analyze_resume_params.dart';
import 'entities/resume_analysis_entity.dart';

abstract class ResumeRepository {
  Future<Either<Failure, ResumeAnalysisEntity>> analyzeResume(
    AnalyzeResumeParams params,
  );
  Future<Either<Failure, List<ResumeAnalysisEntity>>> getAllAnalysis();
}
