import 'package:interview_pilot/feature/interview/data/data_source/remote_interview_data_source.dart';
import 'package:interview_pilot/feature/interview/data/model/create_interview_model.dart';
import 'package:interview_pilot/feature/interview/data/model/interview_model.dart';
import 'package:interview_pilot/feature/interview/data/model/update_interview_model.dart';

import '../../../../core/services/supabase_service/supabase_interview.dart';

class RemoteInterviewDataSourceImpl implements RemoteInterviewDataSource {
  final SupABaseInterview supABaseInterview;

  RemoteInterviewDataSourceImpl(this.supABaseInterview);

  @override
  Future<InterviewModel> createInterview(CreateInterviewModel interview) async {
   return await supABaseInterview.createInterview(interview);
  }

  @override
  Future<void> deleteInterview(String id) async {
    await supABaseInterview.deleteInterview(id);
  }

  @override
  Future<List<InterviewModel>> getAllInterview() async {
    return await supABaseInterview.getAllInterviews();
  }

  @override
  Future<InterviewModel> getInterview(String id) async {
    return await supABaseInterview.getInterview(id);
  }

  @override
  Future<void> updateInterview(UpdateInterviewModel interview) async {
    await supABaseInterview.updateInterview(interview);
  }
}
