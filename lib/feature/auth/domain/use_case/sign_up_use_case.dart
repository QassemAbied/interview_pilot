import 'package:dartz/dartz.dart';
import '../../../../core/error/Failure.dart';
import '../../../../core/helpers/base_use_case.dart';
import '../auth_repository.dart';
import '../entities/auth_params.dart';

class SignUpUseCase implements UseCase<Unit, AuthParams> {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(AuthParams params) async {
    return await repository.signUp(authParams: params);
  }
}
