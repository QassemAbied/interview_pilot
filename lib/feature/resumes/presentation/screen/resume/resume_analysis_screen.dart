import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_pilot/core/utils/enum/request_status.dart';
import 'package:interview_pilot/feature/resumes/presentation/screen/resume/widgets/all_resume_cv.dart';
import 'package:interview_pilot/feature/resumes/presentation/screen/resume/widgets/resume_analysis_form.dart';
import 'package:interview_pilot/feature/resumes/presentation/screen/resume/widgets/resume_analysis_header.dart';
import 'package:interview_pilot/feature/resumes/presentation/screen/resume/widgets/resume_upload_card.dart';
import 'package:interview_pilot/feature/resumes/presentation/screen/resume/widgets/selected_resume_card.dart';
import '../../../../../core/di/injection_container.dart';
import '../../../../../core/routing/route_names.dart';
import '../../../../../core/services/file_picker_service/file_picker.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../controller/resume_cubit.dart';
import '../../controller/resume_state.dart';

class ResumeAnalysisScreen extends StatefulWidget {
  const ResumeAnalysisScreen({super.key});

  @override
  State<ResumeAnalysisScreen> createState() => _ResumeAnalysisScreenState();
}

class _ResumeAnalysisScreenState extends State<ResumeAnalysisScreen> {
  final TextEditingController _targetJobController = TextEditingController();

  final TextEditingController _jobDescriptionController =
      TextEditingController();

  Future<void> _pickResume(BuildContext context) async {
    final file = await FilePickerService().pickPdf();

    if (file == null) {
      return;
    }

    if (!mounted) {
      return;
    }

    context.read<ResumeCubit>().selectResume(file);
  }

  String _formatFileSize(int bytes) {
    final sizeInMb = bytes / (1024 * 1024);

    return '${sizeInMb.toStringAsFixed(1)} MB';
  }

  @override
  void dispose() {
    _targetJobController.dispose();
    _jobDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ResumeCubit>()..getAllAnalysis(),
      child: Scaffold(
        appBar: AppBar(title: const Text('resumes Analysis')),
        body: SafeArea(
          child: BlocConsumer<ResumeCubit, ResumeState>(
            listenWhen: (previous, current) {
              return previous.status != current.status;
            },
            listener: (context, state) async{
              if (state.status == RequestStatus.success) {
                await context.pushNamed(
                  RouteNames.resumeResultAnalysis,
                  extra: state.analysis,
                );
                if (!context.mounted) return;

                context.read<ResumeCubit>().getAllAnalysis();
              }
            },
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ResumeAnalysisHeader(),

                          verticalSpace(28),

                          if (state.selectedResume != null)
                            SelectedResumeCard(
                              fileName: state.selectedResume?.name ?? '',
                              fileSize: _formatFileSize(
                                state.selectedResume?.size ?? 0,
                              ),
                              onRemove: () {
                                context.read<ResumeCubit>().removeResume();
                              },
                            )
                          else
                            ResumeUploadCard(
                              onTap: () async {
                                await _pickResume(context);
                              },
                            ),

                          verticalSpace(28),

                          ResumeAnalysisForm(
                            isLoading: state.status == RequestStatus.loading,
                            targetJobController: _targetJobController,
                            jobDescriptionController: _jobDescriptionController,
                            isAnalyzeEnabled: state.selectedResume != null,
                            onAnalyze: () {
                              context.read<ResumeCubit>().analyzeResume(
                                targetJob: _targetJobController.text,
                                jobDescription: _jobDescriptionController.text,
                              );
                            },
                          ),

                          verticalSpace(24),
                        ],
                      ),
                    ),
                  ),
                  AllResumeCv(
                      analysis: state.analysisList ?? []),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
