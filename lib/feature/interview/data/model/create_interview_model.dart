import 'package:json_annotation/json_annotation.dart';

part 'create_interview_model.g.dart';

@JsonSerializable()
class CreateInterviewModel {
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'job_title')
  final String jobTitle;

  @JsonKey(name: 'company_name')
  final String? companyName;

  @JsonKey(name: 'job_description')
  final String? jobDescription;

  @JsonKey(name: 'interview_type')
  final String interviewType;

  final String level;

  final int score;

  final int duration;

  final String status;

  @JsonKey(name: 'started_at')
  final DateTime startedAt;

  const CreateInterviewModel({
    required this.userId,
    required this.jobTitle,
    this.companyName,
    this.jobDescription,
    required this.interviewType,
    required this.level,
    required this.score,
    required this.duration,
    required this.status,
    required this.startedAt,
  });

  factory CreateInterviewModel.fromJson(Map<String, dynamic> json) =>
      _$CreateInterviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateInterviewModelToJson(this);
}