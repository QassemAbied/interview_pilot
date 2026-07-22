import '../../../interview/data/model/interview_model.dart';
import '../../../interview_result/data/models/interview_evaluation_model.dart';

class InterviewHistoryItemModel {
  final InterviewModel interview;
  final InterviewEvaluationModel evaluation;

  const InterviewHistoryItemModel({
    required this.interview,
    required this.evaluation,
  });

}