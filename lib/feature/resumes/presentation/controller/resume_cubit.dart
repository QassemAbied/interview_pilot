import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilot/core/helpers/base_use_case.dart';
import 'package:interview_pilot/feature/resumes/domain/use_cases/get_all_resume_use_case.dart';
import 'package:interview_pilot/feature/resumes/presentation/controller/resume_state.dart';
import '../../../../core/utils/enum/request_status.dart';
import '../../domain/entities/analyze_resume_params.dart';
import '../../domain/entities/resume_file_entity.dart';
import '../../domain/use_cases/analyze_resume_use_case.dart';

class ResumeCubit extends Cubit<ResumeState> {
  final GetAllResumeUseCase getAllResumeUseCase;
  final AnalyzeResumeUseCase analyzeResumeUseCase;

  ResumeCubit(this.analyzeResumeUseCase, this.getAllResumeUseCase)
    : super(ResumeState());

  void selectResume(PlatformFile file) {
    emit(state.copyWith(selectedResume: file));
  }

  void removeResume() {
    emit(state.copyWith(clearSelectedResume: true));
  }

  Future<void> analyzeResume({
    required String targetJob,
    String? jobDescription,
  }) async {
    final selectedResume = state.selectedResume;

    if (selectedResume == null) {
      return;
    }

    final filePath = selectedResume.path;

    if (filePath == null) {
      emit(
        state.copyWith(
          status: RequestStatus.error,
          errorMessage: 'Unable to access the selected PDF.',
        ),
      );
      return;
    }

    emit(state.copyWith(status: RequestStatus.loading));

    final params = AnalyzeResumeParams(
      resume: ResumeFileEntity(
        name: selectedResume.name,
        path: filePath,
        size: selectedResume.size,
      ),
      targetJob: targetJob.trim(),
      jobDescription: jobDescription?.trim(),
    );

    final result = await analyzeResumeUseCase(params);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: RequestStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (analysis) {
        emit(state.copyWith(status: RequestStatus.success, analysis: analysis));
      },
    );
  }

  Future<void> getAllAnalysis() async {
    emit(state.copyWith(analysisStatus: RequestStatus.loading));
    final result = await getAllResumeUseCase(NoParams());

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            analysisStatus: RequestStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (analysis) {
        emit(
          state.copyWith(
            analysisStatus: RequestStatus.success,
            analysisList: analysis,
          ),
        );
      },
    );
  }
}
