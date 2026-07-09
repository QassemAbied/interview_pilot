import 'package:interview_pilot/feature/auth/data/models/user_model.dart';

import '../../domain/entities/auth_params.dart';

abstract class AuthRemoteDataSource {
  Future<void> signOut();

  Future<void> signIn({required String email, required String password});

  Future<void> signUp({required AuthParams authParams});

  Future<void> createUser({required AuthParams authParams});

  Future<UserModel> getUser();

  Future<void> updateUser({required AuthParams authParams});

  Future<void> forgotPassword({required String email});

  Future<void> resetPassword({required String password});
}
