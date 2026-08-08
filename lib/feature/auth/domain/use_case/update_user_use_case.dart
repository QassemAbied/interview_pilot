import 'package:dartz/dartz.dart';
import '../../../../core/error/Failure.dart';
import '../../../../core/helpers/base_use_case.dart';
import '../auth_repository.dart';
import '../entities/update_params.dart';

class UpdateUserUseCase implements UseCase<Unit, UpdateParams> {
  final AuthRepository repository;

  UpdateUserUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(UpdateParams params) async {
    return await repository.updateUser(authParams: params);
  }
}
