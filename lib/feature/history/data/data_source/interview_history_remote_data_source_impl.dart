import '../../../../core/services/supabase_service/supabase_interview.dart';
import '../../../../core/services/supabase_service/supabase_interview_evaluation.dart';
import '../models/interview_history_item_model.dart';
import 'interview_history_remote_data_source.dart';

class InterviewHistoryRemoteDataSourceImpl
    implements InterviewHistoryRemoteDataSource {
  final SupABaseInterview interviewService;
  final SupABaseInterviewEvaluation evaluationService;

  const InterviewHistoryRemoteDataSourceImpl({
    required this.interviewService,
    required this.evaluationService,
  });

  @override
  Future<List<InterviewHistoryItemModel>> getInterviewHistory() async {
    final interviews = await interviewService.getAllInterviews();

    final historyItems = <InterviewHistoryItemModel>[];

    for (final interview in interviews) {
      try {
        final evaluation = await evaluationService.getEvaluation(interview.id);

        historyItems.add(
          InterviewHistoryItemModel(
            interview: interview,
            evaluation: evaluation,
          ),
        );
      } catch (_) {
        continue;
      }
    }

    return historyItems;
  }
}
