import '../../../../core/services/ai_service/groq_service.dart';
import '../../../../core/services/supabase_service/supabase_interview_evaluation.dart';
import '../../../../core/services/supabase_service/supabase_messages.dart';
import '../models/interview_evaluation_model.dart';
import 'interview_result_remote_data_source.dart';

class InterviewResultRemoteDataSourceImpl
    implements InterviewResultRemoteDataSource {
  final SupABaseMessage messageService;
  final SupABaseInterviewEvaluation evaluationService;
  final GroqService groqService;

  const InterviewResultRemoteDataSourceImpl({
    required this.messageService,
    required this.evaluationService,
    required this.groqService,
  });

  @override
  Future<InterviewEvaluationModel> generateEvaluation({
    required String interviewId,
  }) async {
    final messages = await messageService.getMessages(interviewId);

    return await groqService.generateInterviewEvaluation(
      interviewId: interviewId,
      messages: messages,
    );
  }

  @override
  Future<void> saveEvaluation(InterviewEvaluationModel model) async {
    await evaluationService.saveEvaluation(model);
  }

  @override
  Future<InterviewEvaluationModel> getEvaluation(String interviewId) async {
    return await evaluationService.getEvaluation(interviewId);
  }
}
