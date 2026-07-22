import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilot/core/theme/app_colors.dart';
import 'package:interview_pilot/core/theme/app_text_styles.dart';
import 'package:interview_pilot/core/widgets/spacing.dart';
import 'package:interview_pilot/feature/interview_chat/presentation/screen/widget/end_interview_button.dart';
import '../../../../interview/domain/entities/interview_entity.dart';
import '../../controller/interview_chat_cubit.dart';
import '../../controller/interview_chat_state.dart';

class InterviewQuestionProgress extends StatelessWidget {
  const InterviewQuestionProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      InterviewChatCubit,
      InterviewChatState,
      (int, int, InterviewEntity?)
    >(
      selector: (state) {
        return (state.currentQuestion, state.totalQuestions, state.interview);
      },
      builder: (context, data) {
        final currentQuestion = data.$1;
        final totalQuestions = data.$2;
        final interview = data.$3;
        return Card(
          margin: const EdgeInsets.all(6),

          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Interview',
                        style: AppTextStyle.bold(
                          size: 16,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      verticalSpace(8),
                      Text(
                        '${interview?.jobTitle} ${interview?.interviewType.name} Interview',
                        style: AppTextStyle.bold(
                          size: 16,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      verticalSpace(8),
                      Text(
                        'Question $currentQuestion of $totalQuestions',
                        style: AppTextStyle.semiBold(
                          size: 16,
                          color: AppColors.textSecondary,
                        ),
                      ),

                      verticalSpace(8),

                      LinearProgressIndicator(
                        color: AppColors.primary,
                        value: totalQuestions == 0
                            ? 0
                            : currentQuestion / totalQuestions,
                      ),
                    ],
                  ),
                ),
                EndInterviewButton(
                  interview: interview,
                  onPressed: interview == null
                      ? null
                      : () {
                          context.read<InterviewChatCubit>().endInterview(
                            interview: interview,
                          );
                        },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
