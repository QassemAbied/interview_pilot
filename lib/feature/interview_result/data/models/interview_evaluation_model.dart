import 'package:interview_pilot/feature/interview_result/data/models/technical_scores_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interview_evaluation_model.g.dart';


@JsonSerializable()
class InterviewEvaluationModel {

  final String id;

  @JsonKey(name: 'interview_id')
  final String interviewId;

  @JsonKey(name: 'overall_score')
  final int overallScore;

  @JsonKey(name: 'overall_feedback')
  final String overallFeedback;

  final List<String> strengths;

  final List<String> weaknesses;

  final List<String> recommendations;
  @JsonKey(name: 'technical_scores')
  final TechnicalScoresModel technicalScores;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  const InterviewEvaluationModel({
    required this.id,
    required this.interviewId,
    required this.overallScore,
    required this.overallFeedback,
    required this.strengths,
    required this.weaknesses,
    required this.recommendations,
    required this.createdAt, required this.technicalScores,
  });

  factory InterviewEvaluationModel.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$InterviewEvaluationModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$InterviewEvaluationModelToJson(this);
}