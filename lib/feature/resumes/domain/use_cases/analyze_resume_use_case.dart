import 'package:dartz/dartz.dart';

import '../../../../core/error/Failure.dart';
import '../entities/analyze_resume_params.dart';
import '../entities/resume_analysis_entity.dart';

import '../resume_repository.dart';

class AnalyzeResumeUseCase {
  final ResumeRepository repository;

  const AnalyzeResumeUseCase(this.repository);

  Future<Either<Failure, ResumeAnalysisEntity>> call(
    AnalyzeResumeParams params,
  ) {
    return repository.analyzeResume(params);
  }
}
