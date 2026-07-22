import 'package:dartz/dartz.dart';

import '../../../core/error/Failure.dart';
import '../../../core/helpers/base_repository.dart';
import '../domain/entities/interview_evaluation_entity.dart';
import '../domain/interview_result_repository.dart';
import '../domain/mapper/interview_evaluation_mapper.dart';
import 'data_source/interview_result_remote_data_source.dart';

class InterviewResultRepositoryImpl extends BaseRepository
    implements InterviewResultRepository {
  final InterviewResultRemoteDataSource remoteDataSource;

  InterviewResultRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, InterviewEvaluationEntity>> generateEvaluation({
    required String interviewId,
  }) {
    return execute(() async {
      final model = await remoteDataSource.generateEvaluation(
        interviewId: interviewId,
      );

      return InterviewEvaluationModelMapper.toEntity(model);
    });
  }

  @override
  Future<Either<Failure, Unit>> saveEvaluation(
    InterviewEvaluationEntity evaluation,
  ) {
    return execute(() async {
      final model = InterviewEvaluationEntityMapper.toModel(evaluation);

      await remoteDataSource.saveEvaluation(model);

      return unit;
    });
  }

  @override
  Future<Either<Failure, InterviewEvaluationEntity>> getEvaluation(
    String interviewId,
  ) {
    return execute(() async {
      final model = await remoteDataSource.getEvaluation(interviewId);

      return InterviewEvaluationModelMapper.toEntity(model);
    });
  }
}
