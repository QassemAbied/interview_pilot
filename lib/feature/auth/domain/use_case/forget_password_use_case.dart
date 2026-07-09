import 'package:dartz/dartz.dart';

import '../../../../core/error/Failure.dart';
import '../../../../core/helpers/base_use_case.dart';
import '../auth_repository.dart';

class ForgetPasswordUseCase implements UseCase<Unit, String> {
  final AuthRepository repository;

  ForgetPasswordUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(String params) async {
    return await repository.forgotPassword(email: params);
  }
}
