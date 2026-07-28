import 'package:dartz/dartz.dart';
import 'package:interview_pilot/core/error/Failure.dart';
import 'package:interview_pilot/core/helpers/base_use_case.dart';

import '../entities/resume_analysis_entity.dart';
import '../resume_repository.dart';

class GetAllResumeUseCase extends UseCase<List<ResumeAnalysisEntity> ,void >{
  final ResumeRepository repository;

  GetAllResumeUseCase(this.repository);

  @override
  Future<Either<Failure, List<ResumeAnalysisEntity>>> call(void params)async {
    return await repository.getAllAnalysis();

  }
}