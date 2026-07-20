import '../../../../core/services/supabase_service/supabase_messages.dart';
import '../models/message_model.dart';
import '../models/send_message_model.dart';
import 'message_remote_data_source.dart';

class MessageRemoteDataSourceImpl implements MessageRemoteDataSource {
  final SupABaseMessage supABaseMessage;

  MessageRemoteDataSourceImpl({required this.supABaseMessage});

  @override
  Future<void> sendMessage(SendMessageModel message) {
    return supABaseMessage.sendMessage(message);
  }
  @override
  Future<List<MessageModel>>getMessages  (String interviewId)async {
    return await supABaseMessage.getMessages(interviewId);
  }
  @override
  Stream<List<MessageModel>> watchMessages(String interviewId) {
    return supABaseMessage.watchMessages(interviewId);
  }

  @override
  Future<void> deleteMessages(String interviewId) {
    return supABaseMessage.deleteMessages(interviewId);
  }


}
