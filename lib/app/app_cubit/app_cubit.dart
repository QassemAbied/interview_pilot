import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/services/supabase_service/supabase_auth.dart';
import '../../core/utils/enum/request_status.dart';
import 'app_state.dart';



class AppCubit extends Cubit<AppState> {
  AppCubit({required SupAbaseAuth sessionService})
    : _sessionService = sessionService,
      super(const AppState());

  final SupAbaseAuth _sessionService;

  StreamSubscription<AuthState>? _subscription;

  Future<void> init() async {
    emit(state.copyWith(status: AppStatus.loading));

    await checkSession();

    _listenAuthChanges();
  }

  Future<void> checkSession() async {
    if (_sessionService.isLoggedIn()) {
      emit(state.copyWith(status: AppStatus.authenticated));
    } else {
      emit(state.copyWith(status: AppStatus.unauthenticated));
    }
  }

  void _listenAuthChanges() {
    _subscription?.cancel();

    _subscription = Supabase.instance.client.auth.onAuthStateChange.listen((
      data,
    ) {
      switch (data.event) {
        case AuthChangeEvent.signedIn:
          emit(state.copyWith(status: AppStatus.authenticated));
          break;

        case AuthChangeEvent.signedOut:
          emit(state.copyWith(status: AppStatus.unauthenticated));
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
