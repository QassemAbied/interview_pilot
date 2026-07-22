import '../../../interview/domain/entities/interview_entity.dart';
import '../../domain/entities/interview_evaluation_entity.dart';

class InterviewPdfArgs {
  final InterviewEntity interview;
  final InterviewEvaluationEntity evaluation;

  const InterviewPdfArgs({
    required this.interview,
    required this.evaluation,
  });
}