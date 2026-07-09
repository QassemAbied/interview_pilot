import '../../core/utils/enum/request_status.dart';

class AppState {
  final AppStatus status;

  const AppState({this.status = AppStatus.initial});

  AppState copyWith({AppStatus? status}) {
    return AppState(status: status ?? this.status);
  }
}
