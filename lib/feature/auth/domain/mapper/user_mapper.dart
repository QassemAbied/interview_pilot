import '../../data/models/user_model.dart';
import '../entities/user_entity.dart';

class UserMapper {
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      email: model.email,
      phone: model.phone,
      image: model.image,
      createdAt: model.createdAt,
    );
  }
}
