import '../../data/models/user_model.dart';
import '../entities/user_entity.dart';

class UserMapper {
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      email: model.email,
      createdAt: model.createdAt,
      language: model.language,
      bio: model.bio ?? '',
      streakDays: model.streakDays,
      updatedAt: model.updatedAt,
      avatarUrl: model.avatarUrl ?? "",
    );
  }
}
