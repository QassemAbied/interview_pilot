import 'package:dartz/dartz.dart';

import '../../../core/error/Failure.dart';
import '../../../core/helpers/base_repository.dart';
import '../domain/auth_repository.dart';
import '../domain/entities/auth_params.dart';
import '../domain/entities/user_entity.dart';
import '../domain/mapper/user_mapper.dart';
import 'data_source/auth_remote_data_source.dart';

class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Unit>> signIn({
    required String email,
    required String password,
  }) async {
    return execute(() async {
      await remoteDataSource.signIn(email: email, password: password);

      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> signUp({required AuthParams authParams}) async {
    return await execute(() async {
      await remoteDataSource.signUp(authParams: authParams);
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    return execute(() async {
      await remoteDataSource.signOut();
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> createUser({
    required AuthParams authParams,
  }) async {
    return execute(() async {
      await remoteDataSource.createUser(authParams: authParams);
      return unit;
    });
  }

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    return execute(() async {
      final user = await remoteDataSource.getUser();
      return UserMapper.toEntity(user);
    });
  }

  @override
  Future<Either<Failure, Unit>> updateUser({
    required AuthParams authParams,
  }) async {
    return execute(() async {
      await remoteDataSource.updateUser(authParams: authParams);
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> forgotPassword({required String email}) async {
    return execute(() async {
      await remoteDataSource.forgotPassword(email: email);
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> resetPassword({required String password}) async{
    return execute(() async {
      await remoteDataSource.resetPassword(password: password);
      return unit;
    });
  }
}
