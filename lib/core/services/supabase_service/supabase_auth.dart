import 'package:interview_pilot/core/utils/extension.dart';
import 'package:interview_pilot/feature/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../feature/auth/domain/entities/auth_params.dart';

class SupAbaseAuth {
  final supABase = Supabase.instance.client;

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return await supABase.auth.signInWithPassword(
      password: password,
      email: email,
    );
  }

  Future<AuthResponse> signUp({required AuthParams authParams}) async {
    return await supABase.auth.signUp(
      password: authParams.password,
      email: authParams.email,
      data: {
        'name': authParams.name,
        'phone': authParams.phone,
        'email': authParams.email,
        'image': authParams.image,
      },
    );
  }

  Future<void> signOut() async {
    await supABase.auth.signOut();
  }

  Future<void> createUser({required AuthParams authParams}) async {
    await supABase.from('users').insert({
      'id': supABase.currentUserId,
      'name': authParams.name,
      'phone': authParams.phone,
      'email': authParams.email,
      'image': authParams.image,
    });
  }

  Future<UserModel> getUser() async {
    final response = await supABase
        .from('users')
        .select()
        .eq('id', supABase.currentUserId)
        .maybeSingle();
    if (response == null) {
      throw Exception("User not found");
    }
    return UserModel.fromJson(response);
  }

  Future<void> updateUser({required AuthParams authParams}) async {
    await supABase
        .from('users')
        .update({
          'name': authParams.name,
          'phone': authParams.phone,
          'email': authParams.email,
          'image': authParams.image,
        })
        .eq('id', supABase.currentUserId);
  }

  Future<void> forgotPassword({required String email}) async {
    await supABase.auth.resetPasswordForEmail(
      email,
      redirectTo: 'interviewpilot://reset-password',
    );
  }

  Future<void> resetPassword({required String password}) async {
    await supABase.auth.updateUser(UserAttributes(password: password));
  }

 bool isLoggedIn() {
    final session = supABase.auth.currentSession;

    return session != null;
  }
}
