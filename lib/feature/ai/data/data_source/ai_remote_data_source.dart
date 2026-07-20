import '../models/ai_request_model.dart';

abstract class AiRemoteDataSource {
  Stream<String> askAiStream(AiRequestModel request);

}
