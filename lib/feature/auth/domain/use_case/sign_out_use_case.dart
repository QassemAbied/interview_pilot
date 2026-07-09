import 'package:dartz/dartz.dart';
import '../../../../core/error/Failure.dart';
import '../../../../core/helpers/base_use_case.dart';
import '../auth_repository.dart';

class SignOutUseCase implements UseCase<Unit, NoParams> {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return await repository.signOut();
  }
}
