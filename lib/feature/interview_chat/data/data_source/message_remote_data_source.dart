import '../models/message_model.dart';
import '../models/send_message_model.dart';

abstract class MessageRemoteDataSource {
  Future<void> sendMessage(SendMessageModel message);

  Stream<List<MessageModel>> watchMessages (String interviewId);
  Future<List<MessageModel>> getMessages (String interviewId);

  Future<void> deleteMessages(String interviewId);
}
