import '../../../../core/services/ai_service/groq_service.dart';
import '../models/ai_request_model.dart';
import 'ai_remote_data_source.dart';

class AiRemoteDataSourceImpl implements AiRemoteDataSource {
  final GroqService groqService;

  const AiRemoteDataSourceImpl({required this.groqService});



  @override
  Stream<String> askAiStream(AiRequestModel request) {
    return groqService.askAiStream(request);
  }
}
