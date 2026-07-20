import 'package:interview_pilot/feature/interview/data/model/create_interview_model.dart';
import 'package:interview_pilot/feature/interview/data/model/update_interview_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../feature/interview/data/model/interview_model.dart';
import '../../utils/extension.dart';

class SupABaseInterview {
  final supABase = Supabase.instance.client;

  Future<InterviewModel> createInterview(CreateInterviewModel interview) async {
    final response = await supABase
        .from('interviews')
        .insert(interview.toJson())
        .select()
        .single();
    return InterviewModel.fromJson(response);
  }

  Future<List<InterviewModel>> getAllInterviews() async {
    final response = await supABase
        .from('interviews')
        .select()
        .eq('user_id', supABase.currentUserId)
        .order('created_at', ascending: false);
    return response.map((e) => InterviewModel.fromJson(e)).toList();
  }

  Future<void> updateInterview(UpdateInterviewModel interview) async {
    await supABase
        .from('interviews')
        .update(interview.toJson())
        .eq('id', interview.id);
  }

  Future<void> deleteInterview(String id) async {
    await supABase.from('interviews').delete().eq('id', id);
  }

  Future<InterviewModel> getInterview(String id) async {
    final response = await supABase
        .from('interviews')
        .select()
        .eq('id', id)
        .maybeSingle();
    if (response == null) {
      throw Exception("Interview not found");
    }
    return InterviewModel.fromJson(response);
  }
}
