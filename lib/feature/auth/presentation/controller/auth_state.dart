import '../../../../core/helpers/base_state.dart';
import '../../../../core/utils/enum/request_status.dart';
import '../../domain/entities/user_entity.dart';

class AuthState extends BaseState {
  final UserEntity? user;

  const AuthState({this.user, super.status, super.errorMessage});

  AuthState copyWith({
    UserEntity? user,
    RequestStatus? status,
    String? errorMessage,
  }) {
    return AuthState(
      user: user ?? this.user,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}
