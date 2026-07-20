import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/helpers/base_use_case.dart';
import '../../core/services/supabase_service/supabase_auth.dart';
import '../../core/utils/enum/request_status.dart';
import '../../feature/auth/domain/use_case/get_user_use_case.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required SupAbaseAuth sessionService,
    required GetUserUseCase getUserUseCase,
  }) : _sessionService = sessionService,
       _getUserUseCase = getUserUseCase,
       super(const AppState());

  final SupAbaseAuth _sessionService;

  final GetUserUseCase _getUserUseCase;

  StreamSubscription<AuthState>? _subscription;

  Future<void> init() async {
    emit(state.copyWith(status: AppStatus.loading));

    if (_sessionService.isLoggedIn()) {
      await _loadUser();
    } else {
      emit(state.copyWith(status: AppStatus.unauthenticated));
    }

    _listenAuthChanges();
  }

  Future<void> _loadUser() async {
    final result = await _getUserUseCase(const NoParams());

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: AppStatus.unauthenticated,
            errorMessage: failure.message,
          ),
        );
      },
      (user) {
        emit(state.copyWith(status: AppStatus.authenticated, user: user));
      },
    );
  }

  void _listenAuthChanges() {
    _subscription?.cancel();

    _subscription = Supabase.instance.client.auth.onAuthStateChange.listen((
      data,
    ) async {
      switch (data.event) {
        case AuthChangeEvent.signedIn:
          await _loadUser();
          break;

        case AuthChangeEvent.signedOut:
          emit(const AppState(status: AppStatus.unauthenticated));
          break;

        case AuthChangeEvent.passwordRecovery:
          emit(state.copyWith(status: AppStatus.passwordRecovery));
          break;

        default:
          break;
      }
    });
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
