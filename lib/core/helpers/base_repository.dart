import 'package:dartz/dartz.dart';
import '../error/ApiErrorHandler.dart';
import '../error/Failure.dart';

abstract class BaseRepository {
  Future<Either<Failure, T>> execute<T>(Future<T> Function() callback) async {
    try {
      final result = await callback();

      return Right(result);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
