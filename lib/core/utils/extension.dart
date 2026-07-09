import 'package:supabase_flutter/supabase_flutter.dart';

extension SupABaseExtension on SupabaseClient {
  String get currentUserId {
    final id = auth.currentUser?.id;

    if (id == null) {
      throw Exception('User is not authenticated');
    }

    return id;
  }
}
