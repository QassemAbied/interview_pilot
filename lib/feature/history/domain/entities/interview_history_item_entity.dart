import '../../../interview/domain/entities/interview_entity.dart';
import '../../../interview_result/domain/entities/interview_evaluation_entity.dart';

class InterviewHistoryItemEntity {
  final InterviewEntity interview;
  final InterviewEvaluationEntity evaluation;

  const InterviewHistoryItemEntity({
    required this.interview,
    required this.evaluation,
  });
  static final dummy = InterviewHistoryItemEntity(
    interview: InterviewEntity.dummy,
    evaluation: InterviewEvaluationEntity.dummy,
  );
  static final dummyList = List.generate(
    3,
        (_) => dummy,
  );
}
