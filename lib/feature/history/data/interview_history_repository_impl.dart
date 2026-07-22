import 'package:dartz/dartz.dart';
import '../../../../core/error/Failure.dart';
import '../../../core/helpers/base_repository.dart';
import '../domain/entities/interview_history_item_entity.dart';
import '../domain/interview_history_repository.dart';
import '../domain/mapper/interview_history_mapper.dart';
import 'data_source/interview_history_remote_data_source.dart';

class InterviewHistoryRepositoryImpl extends BaseRepository
    implements InterviewHistoryRepository {
  final InterviewHistoryRemoteDataSource remoteDataSource;

  InterviewHistoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<InterviewHistoryItemEntity>>>
  getInterviewHistory() {
    return execute(() async {
      final models = await remoteDataSource.getInterviewHistory();

      return InterviewHistoryMapper.toListEntity(models);
    });
  }
}
