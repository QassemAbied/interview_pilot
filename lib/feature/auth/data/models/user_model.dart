import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;

  final String name;

  final String email;

  final String? bio;

  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;

  final String language;

  @JsonKey(name: 'streak_days')
  final int streakDays;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.bio,
    this.avatarUrl,
    required this.language,
    required this.streakDays,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
