import 'package:json_annotation/json_annotation.dart';

part 'interview_model.g.dart';

@JsonSerializable()
class InterviewModel {
  final String id;

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

  /// بالثواني
  final int duration;

  final String status;

  @JsonKey(name: 'started_at')
  final DateTime? startedAt;

  @JsonKey(name: 'ended_at')
  final DateTime? endedAt;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  const InterviewModel({
    required this.id,
    required this.userId,
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
    required this.createdAt,
    required this.updatedAt,
  });

  factory InterviewModel.fromJson(Map<String, dynamic> json) =>
      _$InterviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$InterviewModelToJson(this);
}
