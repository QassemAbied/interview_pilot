import 'package:dartz/dartz.dart';
import 'package:interview_pilot/core/error/Failure.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams {
  const NoParams();
}
