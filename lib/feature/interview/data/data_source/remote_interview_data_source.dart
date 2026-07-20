import 'package:interview_pilot/feature/interview/data/model/create_interview_model.dart';
import 'package:interview_pilot/feature/interview/data/model/interview_model.dart';
import 'package:interview_pilot/feature/interview/data/model/update_interview_model.dart';

abstract class RemoteInterviewDataSource {
  Future<InterviewModel> createInterview(CreateInterviewModel interview);
  Future<void> updateInterview(UpdateInterviewModel interview);
  Future<void> deleteInterview(String id);
  Future<InterviewModel> getInterview(String id);
  Future<List<InterviewModel>> getAllInterview();
}