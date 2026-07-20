import 'package:equatable/equatable.dart';
import '../../../feature/auth/domain/entities/user_entity.dart';
import '../../core/utils/enum/request_status.dart';

class AppState extends Equatable {
  final AppStatus status;

  final UserEntity? user;

  final String? errorMessage;

  const AppState({
    this.status = AppStatus.initial,
    this.user,
    this.errorMessage,
  });

  AppState copyWith({
    AppStatus? status,
    UserEntity? user,
    String? errorMessage,
  }) {
    return AppState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, user, errorMessage];
}
