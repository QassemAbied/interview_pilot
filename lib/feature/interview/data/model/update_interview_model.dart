import 'package:json_annotation/json_annotation.dart';

part 'update_interview_model.g.dart';

@JsonSerializable()
class UpdateInterviewModel {
  final String id;
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
  final DateTime? startedAt;

  @JsonKey(name: 'ended_at')
  final DateTime? endedAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  const UpdateInterviewModel({
    required this.id,
    required this.jobTitle,
    this.companyName,
    this.jobDescription,
    required this.interviewType,
    required this.level,
    required this.score,
    required this.duration,
    required this.status,
    this.startedAt,
    this.endedAt,
    required this.updatedAt,
  });

  factory UpdateInterviewModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateInterviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateInterviewModelToJson(this);
}