// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:interview_pilot/feature/interview_result/domain/use_case/get_evaluation_use_case.dart';
//
// import '../../../../core/utils/enum/request_status.dart';
// import '../../../interview/domain/use_case/get_interview_use_case.dart';
// import '../../domain/use_case/generate_evaluation_use_case.dart';
// import '../../domain/use_case/save_evaluation_use_case.dart';
// import 'interview_result_state.dart';
//
// class InterviewResultCubit extends Cubit<InterviewResultState> {
//   // final GenerateEvaluationUseCase generateInterviewEvaluationUseCase;
//   // final GetEvaluationUseCase getInterviewEvaluationUseCase;
//   // final SaveEvaluationUseCase saveInterviewEvaluationUseCase;
//   // final GetInterviewUseCase getInterviewUseCase;
//   // InterviewResultCubit({
//   //   required this.generateInterviewEvaluationUseCase,
//   //   required this.saveInterviewEvaluationUseCase,
//   //   required this.getInterviewEvaluationUseCase,
//   //   required this.getInterviewUseCase,
//   // }) : super(const InterviewResultState());
//   //
//   //
//   // Future<void> initialize({required String interviewId}) async {
//   //   final getEvaluationResult = await getEvaluation( interviewId: interviewId);
//   //  final generateEvaluationResult =  await generateEvaluation(interviewId: interviewId);
//   //  if(getEvaluationResult == null){
//   //    await generateEvaluationResult;
//   //  }
//   //
//   //   final interviewResult = await getInterviewUseCase(interviewId);
//   //   await interviewResult.fold(
//   //     (failure) async {
//   //       emit(
//   //         state.copyWith(
//   //           status: RequestStatus.error,
//   //           errorMessage: failure.message,
//   //         ),
//   //       );
//   //       },
//   //     (interview) async {
//   //       emit(state.copyWith(interview: interview));
//   //     },
//   //   );
//   // }
//   //
//   //
//   //
//   // Future<void> generateEvaluation({required String interviewId}) async {
//   //   emit(state.copyWith(status: RequestStatus.loading));
//   //
//   //   final generateResult = await generateInterviewEvaluationUseCase(
//   //     interviewId,
//   //   );
//   //
//   //   await generateResult.fold(
//   //     (failure) async {
//   //       emit(
//   //         state.copyWith(
//   //           status: RequestStatus.error,
//   //           errorMessage: failure.message,
//   //         ),
//   //       );
//   //     },
//   //     (evaluation) async {
//   //       final saveResult = await saveInterviewEvaluationUseCase(evaluation);
//   //
//   //       saveResult.fold(
//   //         (failure) {
//   //           emit(
//   //             state.copyWith(
//   //               status: RequestStatus.error,
//   //               errorMessage: failure.message,
//   //             ),
//   //           );
//   //         },
//   //         (_) {
//   //           emit(
//   //             state.copyWith(
//   //               status: RequestStatus.success,
//   //               evaluation: evaluation,
//   //             ),
//   //           );
//   //         },
//   //       );
//   //     },
//   //   );
//   // }
//   //
//   // Future<void> getEvaluation({required String interviewId}) async {
//   //   emit(state.copyWith(status: RequestStatus.loading));
//   //   final result = await getInterviewEvaluationUseCase(interviewId);
//   //   result.fold(
//   //     (failure) {
//   //       emit(
//   //         state.copyWith(
//   //           status: RequestStatus.error,
//   //           errorMessage: failure.message,
//   //         ),
//   //       );
//   //     },
//   //     (evaluation) {
//   //       emit(
//   //         state.copyWith(status: RequestStatus.success, evaluation: evaluation),
//   //       );
//   //     },
//   //   );
//   // }
// }
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enum/request_status.dart';
import '../../../interview/domain/entities/interview_entity.dart';
import '../../../interview/domain/use_case/get_interview_use_case.dart';
import '../../domain/use_case/generate_evaluation_use_case.dart';
import '../../domain/use_case/get_evaluation_use_case.dart';
import '../../domain/use_case/save_evaluation_use_case.dart';
import 'interview_result_state.dart';

class InterviewResultCubit extends Cubit<InterviewResultState> {
  final GenerateEvaluationUseCase generateInterviewEvaluationUseCase;
  final GetEvaluationUseCase getInterviewEvaluationUseCase;
  final SaveEvaluationUseCase saveInterviewEvaluationUseCase;
  final GetInterviewUseCase getInterviewUseCase;

  InterviewResultCubit({
    required this.generateInterviewEvaluationUseCase,
    required this.saveInterviewEvaluationUseCase,
    required this.getInterviewEvaluationUseCase,
    required this.getInterviewUseCase,
  }) : super(const InterviewResultState());

  Future<void> initialize({required String interviewId}) async {
    emit(state.copyWith(status: RequestStatus.loading));

    final interviewResult = await getInterviewUseCase(interviewId);

    final interview = interviewResult.fold((failure) {
      emit(
        state.copyWith(
          status: RequestStatus.error,
          errorMessage: failure.message,
        ),
      );

      return null;
    }, (interview) => interview);

    if (interview == null) {
      return;
    }

    final evaluationResult = await getInterviewEvaluationUseCase(interviewId);

    await evaluationResult.fold(
      (failure) async {
        await _generateEvaluation(
          interviewId: interviewId,
          interview: interview,
        );
      },
      (evaluation) async {
        emit(
          state.copyWith(
            status: RequestStatus.success,
            interview: interview,
            evaluation: evaluation,
          ),
        );
      },
    );
  }

  Future<void> _generateEvaluation({
    required String interviewId,
    required InterviewEntity interview,
  }) async {
    final generateResult = await generateInterviewEvaluationUseCase(
      interviewId,
    );

    await generateResult.fold(
      (failure) async {
        emit(
          state.copyWith(
            status: RequestStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (evaluation) async {
        final saveResult = await saveInterviewEvaluationUseCase(evaluation);

        saveResult.fold(
          (failure) {
            emit(
              state.copyWith(
                status: RequestStatus.error,
                errorMessage: failure.message,
              ),
            );
          },
          (_) {
            emit(
              state.copyWith(
                status: RequestStatus.success,
                interview: interview,
                evaluation: evaluation,
              ),
            );
          },
        );
      },
    );
  }
}
