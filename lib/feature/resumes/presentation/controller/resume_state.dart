import 'package:file_picker/file_picker.dart';
import 'package:interview_pilot/core/helpers/base_state.dart';

import '../../../../core/utils/enum/request_status.dart';
import '../../domain/entities/resume_analysis_entity.dart';

class ResumeState extends BaseState {
  final PlatformFile? selectedResume;
  final RequestStatus analysisStatus;
  final ResumeAnalysisEntity? analysis;
  final List<ResumeAnalysisEntity>? analysisList;

  const ResumeState({
    this.selectedResume,
    super.status = RequestStatus.initial,
    this.analysisStatus = RequestStatus.initial,
    this.analysisList,
    this.analysis,
    super.errorMessage,
  });

  ResumeState copyWith({
    RequestStatus? status,
    PlatformFile? selectedResume,
    ResumeAnalysisEntity? analysis,
    RequestStatus? analysisStatus,
    List<ResumeAnalysisEntity>? analysisList,
    bool clearSelectedResume = false,
    String? errorMessage,
  }) {
    return ResumeState(
      status: status ?? this.status,
      selectedResume: clearSelectedResume
          ? null
          : selectedResume ?? this.selectedResume,
      analysis: analysis ?? this.analysis,
      analysisStatus: analysisStatus ?? this.analysisStatus,
      analysisList: analysisList ?? this.analysisList,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
