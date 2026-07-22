import '../models/interview_evaluation_model.dart';

abstract class InterviewResultRemoteDataSource {
  Future<InterviewEvaluationModel> generateEvaluation({
    required String interviewId,
  });

  Future<void> saveEvaluation(InterviewEvaluationModel model);

  Future<InterviewEvaluationModel> getEvaluation(String interviewId);
}
