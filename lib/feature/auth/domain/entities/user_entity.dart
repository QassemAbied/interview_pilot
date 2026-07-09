class UserEntity {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final DateTime createdAt;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.createdAt,
  });
}
