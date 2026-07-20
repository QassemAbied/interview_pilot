import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/base_use_case.dart';
import '../../../../core/utils/enum/request_status.dart';
import '../../domain/entities/auth_params.dart';
import '../../domain/use_case/create_user_use_case.dart';
import '../../domain/use_case/forget_password_use_case.dart';
import '../../domain/use_case/get_user_use_case.dart';
import '../../domain/use_case/rest_password_use_case.dart';
import '../../domain/use_case/sign_in_use_case.dart';
import '../../domain/use_case/sign_out_use_case.dart';
import '../../domain/use_case/sign_up_use_case.dart';
import '../../domain/use_case/update_user_use_case.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInUseCase signInUseCase;

  final SignUpUseCase signUpUseCase;

  final SignOutUseCase signOutUseCase;

  final CreateUserUseCase createUserUseCase;

  final GetUserUseCase getUserUseCase;

  final UpdateUserUseCase updateUserUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final RestPasswordUseCase restPasswordUseCase;

  AuthCubit({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.signOutUseCase,
    required this.createUserUseCase,
    required this.getUserUseCase,
    required this.updateUserUseCase,
    required this.forgetPasswordUseCase,
    required this.restPasswordUseCase,
  }) : super(const AuthState());

  Future<void> signIn(AuthParams params) async {
    emit(state.copyWith(status: RequestStatus.loading));

    final result = await signInUseCase(params);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: RequestStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (_) {
        emit(state.copyWith(status: RequestStatus.success));
      },
    );
  }

  Future<void> signUp(AuthParams params) async {
    emit(state.copyWith(status: RequestStatus.loading));

    final result = await signUpUseCase(params);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: RequestStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (_) async {
        await createUser(params);
        if (isClosed) return;
        emit(state.copyWith(status: RequestStatus.success));
      },
    );
  }

  Future<void> createUser(AuthParams params) async {
    await createUserUseCase(params);
  }

  Future<void> getUser() async {
    emit(state.copyWith(status: RequestStatus.loading));

    final result = await getUserUseCase(const NoParams());

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: RequestStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (user) {
        emit(state.copyWith(user: user, status: RequestStatus.success));
      },
    );
  }

  Future<void> updateUser(AuthParams params) async {
    emit(state.copyWith(status: RequestStatus.loading));

    final result = await updateUserUseCase(params);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: RequestStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (_) async {
        await getUser();

        emit(state.copyWith(status: RequestStatus.success));
      },
    );
  }

  Future<void> signOut() async {
    emit(state.copyWith(status: RequestStatus.loading));

    final result = await signOutUseCase(const NoParams());

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: RequestStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (_) {
        emit(const AuthState(status: RequestStatus.success));
      },
    );
  }

  Future<void> forgotPassword(String email) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await forgetPasswordUseCase(email);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: RequestStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (_) {
        emit(state.copyWith(status: RequestStatus.success));
      },
    );
  }

  Future<void> restPassword(String password) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await restPasswordUseCase(password);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: RequestStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (_) {
        emit(state.copyWith(status: RequestStatus.success));
      },
    );
  }
}
