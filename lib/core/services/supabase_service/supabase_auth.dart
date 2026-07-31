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
    try {
      final res = await supABase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      print("SUCCESS: $res");
      return res;
    } catch (e, s) {
      print("TYPE = ${e.runtimeType}");
      print("ERROR = $e");
      print("STACK = $s");
      rethrow;
    }
  }

  Future<AuthResponse> signUp({required AuthParams authParams}) async {
    final response = await Supabase.instance.client.from('profiles').select().limit(1);

    print(response);
    return await supABase.auth.signUp(
      password: authParams.password,
      email: authParams.email,
      data: {
        'name': authParams.name,
        'email': authParams.email,
        'image': authParams.image,
      },
    );
  }

  Future<void> signOut() async {
    await supABase.auth.signOut();
  }


  Future<void> createUser({required AuthParams authParams}) async {
    await supABase.from('profiles').insert({
      'id': supABase.currentUserId,
      'name': authParams.name,
      'email': authParams.email,
      'avatar_url': authParams.image,
      'bio': null,
      'language': 'en',
      'streak_days': 0,
      'updated_at': DateTime.now().toIso8601String(),
    });
  }

  Future<UserModel> getUser() async {
    final response = await supABase
        .from('profiles')
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
        .from('profiles')
        .update({
          'name': authParams.name,
          'bio': authParams.bio,
          'language': authParams.language,
          'avatar_url': authParams.image,
          'updated_at': DateTime.now().toIso8601String(),
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
