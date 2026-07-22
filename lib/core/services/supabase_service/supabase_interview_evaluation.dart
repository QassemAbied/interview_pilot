import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../feature/interview_result/data/models/interview_evaluation_model.dart';

class SupABaseInterviewEvaluation {
  final supABase = Supabase.instance.client;
  Future<void> saveEvaluation(InterviewEvaluationModel evaluation) async {
    final data = evaluation.toJson();

    data.remove('id');
    data.remove('created_at');

    await supABase.from('interview_evaluations').insert(data);
  }

  Future<InterviewEvaluationModel> getEvaluation(String interviewId) async {
    final response = await supABase
        .from('interview_evaluations')
        .select()
        .eq('interview_id', interviewId)
        .single();

    return InterviewEvaluationModel.fromJson(response);
  }

  Future<void> deleteEvaluation(String interviewId) async {
    await supABase
        .from('interview_evaluations')
        .delete()
        .eq('interview_id', interviewId);
  }

  Future<void> updateEvaluation(InterviewEvaluationModel evaluation) async {
    await supABase
        .from('interview_evaluations')
        .update(evaluation.toJson())
        .eq('interview_id', evaluation.interviewId);
  }
}
