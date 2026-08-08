class UserEntity {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final DateTime createdAt;
  final String bio;
  final String language;
  final int streakDays;
  final DateTime updatedAt;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.bio,
    required this.language,
    required this.streakDays,
    required this.updatedAt,
    required this.avatarUrl,
  });

  static final dummy = UserEntity(
    id: '',
    name: 'qassem',
    email: 'qafdsfds@gmail.com',
    avatarUrl: '',
    createdAt: DateTime.now(),
    bio: 'fdsfsdfgdsgvfgvfsdbs',
    language: 'sdfsad',
    streakDays: 0,
    updatedAt: DateTime.now(),
  );
}
