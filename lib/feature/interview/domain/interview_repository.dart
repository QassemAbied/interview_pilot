import 'package:dartz/dartz.dart';
import 'package:interview_pilot/core/error/Failure.dart';
import 'package:interview_pilot/feature/interview/domain/entities/create_interview_entity.dart';
import 'package:interview_pilot/feature/interview/domain/entities/interview_entity.dart';
import 'package:interview_pilot/feature/interview/domain/entities/update_interview_entity.dart';

abstract class InterviewRepository {
  Future<Either<Failure, InterviewEntity>> createInterview(CreateInterviewEntity interview);
  Future<Either<Failure, Unit>> updateInterview(UpdateInterviewEntity interview);
  Future<Either<Failure, Unit>> deleteInterview(String id);
  Future<Either<Failure, InterviewEntity>> getInterview(String id);
  Future<Either<Failure, List<InterviewEntity>>> getAllInterview();
}
