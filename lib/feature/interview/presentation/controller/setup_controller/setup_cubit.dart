import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilot/feature/interview/domain/entities/create_interview_entity.dart';
import 'package:interview_pilot/feature/interview/domain/use_case/create_interview_use_case.dart';
import 'package:interview_pilot/feature/interview/domain/use_case/get_interview_use_case.dart';
import 'package:interview_pilot/feature/interview/presentation/controller/setup_controller/setup_state.dart';
import '../../../../../core/utils/enum/interview_enum.dart';
import '../../../../../core/utils/enum/request_status.dart';

class SetupCubit extends Cubit<SetupState> {
  final CreateInterviewUseCase createInterviewUseCase;
  final GetInterviewUseCase getInterviewUseCase;

  SetupCubit({
    required this.createInterviewUseCase,
    required this.getInterviewUseCase,
  }) : super(SetupState());

  void changeInterviewType(InterviewType type) {
    emit(state.copyWith(interviewType: type));
  }

  void changeExperienceLevel(ExperienceLevel level) {
    emit(state.copyWith(experienceLevel: level));
  }

  Future createInterview({
    required CreateInterviewEntity createInterview,
  }) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await createInterviewUseCase(createInterview);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: RequestStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (data) async {
        emit(state.copyWith(status: RequestStatus.success, interview: data));
      },
    );
  }

  Future getInterview({required String interviewId}) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await getInterviewUseCase(interviewId);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: RequestStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (data) {
        emit(state.copyWith(status: RequestStatus.success, interview: data));
      },
    );
  }

}
