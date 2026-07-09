import '../utils/enum/request_status.dart';

abstract class BaseState {
  final RequestStatus status;
  final String? errorMessage;

  const BaseState({
    this.status = RequestStatus.initial,
    this.errorMessage,
  });
}