import 'package:json_annotation/json_annotation.dart';

part 'technical_scores_model.g.dart';

@JsonSerializable()
class TechnicalScoresModel {
  final int flutter;

  final int architecture;

  @JsonKey(name: 'problem_solving')
  final int problemSolving;

  final int communication;

  final int confidence;

  const TechnicalScoresModel({
    required this.flutter,
    required this.architecture,
    required this.problemSolving,
    required this.communication,
    required this.confidence,
  });

  factory TechnicalScoresModel.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$TechnicalScoresModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TechnicalScoresModelToJson(this);
}