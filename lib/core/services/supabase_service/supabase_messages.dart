import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../feature/interview_chat/data/models/message_model.dart';
import '../../../feature/interview_chat/data/models/send_message_model.dart';

class SupABaseMessage {
  final supABase = Supabase.instance.client;

  Future<void> sendMessage(SendMessageModel message) async {
    await supABase.from('messages').insert(message.toJson());
  }

  Future<List<MessageModel>> getMessages(String interviewId) async {
    final response = await supABase
        .from('messages')
        .select()
        .eq('interview_id', interviewId)
        .order('created_at', ascending: true);

    return response.map((e) => MessageModel.fromJson(e)).toList();
  }

  Stream<List<MessageModel>> watchMessages(String interviewId) {
    return supABase
        .from('messages')
        .stream(primaryKey: ['id'])
        .eq('interview_id', interviewId)
        .order('created_at', ascending: true)
        .map((event) => event.map((e) => MessageModel.fromJson(e)).toList());
  }

  Future<void> deleteMessages(String interviewId) async {
    await supABase.from('messages').delete().eq('interview_id', interviewId);
  }
}
