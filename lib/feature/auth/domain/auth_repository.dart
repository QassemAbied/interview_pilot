import 'package:dartz/dartz.dart';
import '../../../core/error/Failure.dart';
import 'entities/auth_params.dart';
import 'entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> signUp({required AuthParams authParams});

  Future<Either<Failure, Unit>> signOut();

  Future<Either<Failure, Unit>> createUser({required AuthParams authParams});

  Future<Either<Failure, UserEntity>> getUser();

  Future<Either<Failure, Unit>> updateUser({required AuthParams authParams});

  Future<Either<Failure, Unit>> forgotPassword({required String email});

  Future<Either<Failure, Unit>> resetPassword({required String password});
}
