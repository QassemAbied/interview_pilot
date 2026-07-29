import '../../../../core/services/supabase_service/supabase_interview_evaluation.dart';
import '../../../../core/services/supabase_service/supabase_messages.dart';
import '../models/interview_evaluation_model.dart';
import '../services/interview_evaluation_ai_service.dart';
import 'interview_result_remote_data_source.dart';

class InterviewResultRemoteDataSourceImpl
    implements InterviewResultRemoteDataSource {
  final SupABaseMessage messageService;
  final SupABaseInterviewEvaluation evaluationService;
  final InterviewEvaluationAiService interviewEvaluationAiService;

  const InterviewResultRemoteDataSourceImpl({
    required this.messageService,
    required this.evaluationService,
    required this.interviewEvaluationAiService,
  });

  @override
  Future<InterviewEvaluationModel> generateEvaluation({
    required String interviewId,
  }) async {
    final messages = await messageService.getMessages(interviewId);

    return await interviewEvaluationAiService.generateEvaluation(
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
