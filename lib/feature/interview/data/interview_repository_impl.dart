import 'package:dartz/dartz.dart';

import 'package:interview_pilot/core/error/Failure.dart';
import 'package:interview_pilot/core/helpers/base_repository.dart';
import 'package:interview_pilot/feature/interview/domain/entities/create_interview_entity.dart';

import 'package:interview_pilot/feature/interview/domain/entities/interview_entity.dart';
import 'package:interview_pilot/feature/interview/domain/entities/update_interview_entity.dart';

import '../domain/interview_repository.dart';
import '../domain/mapper/create_interview_mapper.dart';
import '../domain/mapper/interview_mapper.dart';
import '../domain/mapper/update_interview_mapper.dart';
import 'data_source/remote_interview_data_source.dart';

class InterviewRepositoryImpl extends BaseRepository
    implements InterviewRepository {
  final RemoteInterviewDataSource remoteInterviewDataSource;

  InterviewRepositoryImpl(this.remoteInterviewDataSource);

  @override
  Future<Either<Failure, InterviewEntity>> createInterview(
    CreateInterviewEntity interview,
  ) async {
    return await execute(() async {
      final result =  await remoteInterviewDataSource.createInterview(
      CreateInterviewMapper.toModel(interview),
      );
      return InterviewMapper.toEntity(result) ;
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteInterview(String id) async {
    return await execute(() async {
      await remoteInterviewDataSource.deleteInterview(id);
      return unit;
    });
  }

  @override
  Future<Either<Failure, List<InterviewEntity>>> getAllInterview() async {
    return await execute(() async {
      final result = await remoteInterviewDataSource.getAllInterview();
      return InterviewMapper.toListEntity(result);
    });
  }

  @override
  Future<Either<Failure, InterviewEntity>> getInterview(String id) async {
    return await execute(() async {
      final result = await remoteInterviewDataSource.getInterview(id);
      return InterviewMapper.toEntity(result);
    });
  }

  @override
  Future<Either<Failure, Unit>> updateInterview(
    UpdateInterviewEntity interview,
  ) async {
    return await execute(() async {
      await remoteInterviewDataSource.updateInterview(
        UpdateInterviewMapper.toModel(interview),
      );
      return unit;
    });
  }
}
