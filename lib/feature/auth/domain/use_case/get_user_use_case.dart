import 'package:dartz/dartz.dart';
import '../../../../core/error/Failure.dart';
import '../../../../core/helpers/base_use_case.dart';
import '../auth_repository.dart';
import '../entities/user_entity.dart';

class GetUserUseCase implements UseCase<UserEntity, NoParams> {
  final AuthRepository repository;

  GetUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await repository.getUser();
  }
}
