import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/constants/app_spac.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/utils/enum/interview_enum.dart';
import '../../../../../../core/widgets/spacing.dart';
import '../../../controller/setup_controller/setup_cubit.dart';
import '../../../controller/setup_controller/setup_state.dart';
import 'interview_type_card.dart';

class InterviewTypeSection extends StatelessWidget {
  const InterviewTypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetupCubit, SetupState>(
      builder: (context, state) {
        final cubit = context.read<SetupCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Interview Type',
              style: AppTextStyle.bold(size: 20, color: AppColors.textPrimary),
            ),

            verticalSpace(AppSpacing.s16),

            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: AppSpacing.s16,
              mainAxisSpacing: AppSpacing.s16,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.4,
              children: [
                InterviewTypeCard(
                  title: 'Technical',
                  icon: Icons.code_rounded,
                  isSelected: state.interviewType == InterviewType.technical,
                  onTap: () =>
                      cubit.changeInterviewType(InterviewType.technical),
                ),

                InterviewTypeCard(
                  title: 'HR',
                  icon: Icons.badge_outlined,
                  isSelected: state.interviewType == InterviewType.hr,
                  onTap: () => cubit.changeInterviewType(InterviewType.hr),
                ),

                InterviewTypeCard(
                  title: 'Behavioral',
                  icon: Icons.psychology_alt_outlined,
                  isSelected: state.interviewType == InterviewType.behavioral,
                  onTap: () =>
                      cubit.changeInterviewType(InterviewType.behavioral),
                ),

                InterviewTypeCard(
                  title: 'Mixed',
                  icon: Icons.auto_awesome_outlined,
                  isSelected: state.interviewType == InterviewType.mixed,
                  onTap: () => cubit.changeInterviewType(InterviewType.mixed),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
