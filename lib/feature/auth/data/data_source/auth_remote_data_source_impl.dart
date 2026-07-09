import 'package:interview_pilot/core/services/supabase_service/supabase_auth.dart';
import 'package:interview_pilot/feature/auth/data/models/user_model.dart';
import '../../domain/entities/auth_params.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupAbaseAuth supAbaseAuth;

  AuthRemoteDataSourceImpl({required this.supAbaseAuth});

  @override
  Future<void> createUser({required AuthParams authParams}) async {
    await supAbaseAuth.createUser(authParams: authParams);
  }

  @override
  Future<UserModel> getUser() async {
    return await supAbaseAuth.getUser();
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    await supAbaseAuth.signIn(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await supAbaseAuth.signOut();
  }

  @override
  Future<void> signUp({required AuthParams authParams}) async {
    await supAbaseAuth.signUp(authParams: authParams);
  }

  @override
  Future<void> updateUser({required AuthParams authParams}) async {
    await supAbaseAuth.updateUser(authParams: authParams);
  }

  @override
  Future<void> forgotPassword({required String email})async {
    await supAbaseAuth.forgotPassword(email: email);
  }

  @override
  Future<void> resetPassword({required String password})async {
    await supAbaseAuth.resetPassword(password: password);
  }
}
