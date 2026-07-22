import '../models/interview_history_item_model.dart';

abstract class InterviewHistoryRemoteDataSource {
  Future<List<InterviewHistoryItemModel>> getInterviewHistory();
}