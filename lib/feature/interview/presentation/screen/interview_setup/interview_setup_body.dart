import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_pilot/core/widgets/app_snak_bar.dart';
import 'package:interview_pilot/feature/interview/presentation/screen/interview_setup/widgets/company_field.dart';
import 'package:interview_pilot/feature/interview/presentation/screen/interview_setup/widgets/description_field.dart';
import 'package:interview_pilot/feature/interview/presentation/screen/interview_setup/widgets/experience_level_section.dart';
import 'package:interview_pilot/feature/interview/presentation/screen/interview_setup/widgets/interview_header.dart';
import 'package:interview_pilot/feature/interview/presentation/screen/interview_setup/widgets/interview_type_section.dart';
import 'package:interview_pilot/feature/interview/presentation/screen/interview_setup/widgets/job_title_field.dart';
import '../../../../../core/constants/app_spac.dart';
import '../../../../../core/routing/route_names.dart';
import '../../../../../core/utils/enum/request_status.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_dialog.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../../domain/entities/create_interview_entity.dart';
import '../../controller/setup_controller/setup_cubit.dart';
import '../../controller/setup_controller/setup_state.dart';

class InterviewSetupBody extends StatefulWidget {
  const InterviewSetupBody({super.key});

  @override
  State<InterviewSetupBody> createState() => _InterviewSetupBodyState();
}

class _InterviewSetupBodyState extends State<InterviewSetupBody> {
  final _formKey = GlobalKey<FormState>();

  final _jobTitleController = TextEditingController();
  final _companyController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _jobTitleController.dispose();
    _companyController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SetupCubit, SetupState>(
      listener: (context, state) {
        if (state.status == RequestStatus.loading) {
          AppDialog.showCircle(context);
        }

        if (state.status == RequestStatus.error) {
          AppSnackBar.error(
            context,
            message: state.errorMessage ?? 'Something went wrong!',
          );
        }
        if (state.status == RequestStatus.success) {
          //context.read<InterviewChatCubit>().startInterviewMessage(state.interview!);
          context.pop();
          context.pushNamed(
            RouteNames.interview,
            pathParameters: {
              'interviewId': state.interview!.id,
            },
          );
        }

      },
      child: Form(
        key: _formKey,
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              centerTitle: true,
              title: Text('Start Interview'),
            ),

            SliverPadding(
              padding: const EdgeInsets.all(AppSpacing.s16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const InterviewHeader(),

                  verticalSpace(AppSpacing.s32),

                  InterviewTypeSection(),

                  verticalSpace(AppSpacing.s32),

                  ExperienceLevelSection(),

                  verticalSpace(AppSpacing.s32),

                  JobTitleField(controller: _jobTitleController),

                  verticalSpace(AppSpacing.s20),

                  CompanyField(controller: _companyController),

                  verticalSpace(AppSpacing.s20),

                  JobDescriptionField(controller: _descriptionController),

                  verticalSpace(AppSpacing.s40),
                  AppButton(
                    title: 'Start Interview',
                    icon: Icon(Icons.record_voice_over_rounded),
                    isLoading: false,
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;
                      context.read<SetupCubit>().createInterview(
                        createInterview: CreateInterviewEntity(
                          jobTitle: _jobTitleController.text,
                          companyName: _companyController.text,
                          jobDescription: _descriptionController.text,
                          interviewType: context
                              .read<SetupCubit>()
                              .state
                              .interviewType,
                          level: context
                              .read<SetupCubit>()
                              .state
                              .experienceLevel,
                        ),
                      );
                    },
                  ),
                  verticalSpace(AppSpacing.s24),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
