import '../../../../core/helpers/base_state.dart';
import '../../../../core/utils/enum/request_status.dart';
import '../../domain/entities/dashboard_entity.dart';

class HomeState extends BaseState {
  final DashboardEntity? dashboard;

  const HomeState({this.dashboard, super.status, super.errorMessage});

  HomeState copyWith({
    DashboardEntity? dashboard,
    RequestStatus? status,
    String? errorMessage,
  }) {
    return HomeState(
      dashboard: dashboard ?? this.dashboard,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}
