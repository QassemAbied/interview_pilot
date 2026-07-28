import 'package:dartz/dartz.dart';
import 'package:interview_pilot/core/error/Failure.dart';

import '../../../core/helpers/base_repository.dart';
import '../domain/entities/analyze_resume_params.dart';
import '../domain/entities/resume_analysis_entity.dart';
import '../domain/mapper/resume_analysis_mapper.dart';
import '../domain/resume_repository.dart';
import 'data_source/resume_remote_data_source.dart';

class ResumeRepositoryImpl extends BaseRepository implements ResumeRepository {
  final ResumeRemoteDataSource remoteDataSource;

  ResumeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ResumeAnalysisEntity>> analyzeResume(
    AnalyzeResumeParams params,
  ) {
    return execute(() async {
      final model = await remoteDataSource.analyzeResume(params);

      return ResumeAnalysisModelMapper.toEntity(model);
    });
  }

  @override
  Future<Either<Failure, List<ResumeAnalysisEntity>>> getAllAnalysis() {
    return execute(() async {
      final models = await remoteDataSource.getAllAnalysis();
      return models.map((e) => ResumeAnalysisModelMapper.toEntity(e)).toList();
    });
  }
}
