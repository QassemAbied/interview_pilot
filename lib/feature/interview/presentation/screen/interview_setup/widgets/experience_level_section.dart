import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilot/core/utils/enum/interview_enum.dart';
import '../../../../../../core/constants/app_spac.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/spacing.dart';
import '../../../controller/setup_controller/setup_cubit.dart';
import '../../../controller/setup_controller/setup_state.dart';
import 'experience_level_chip.dart';

class ExperienceLevelSection extends StatelessWidget {
  const ExperienceLevelSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetupCubit, SetupState>(
      builder: (context, state) {
        final cubit = context.read<SetupCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Experience Level',
              style: AppTextStyle.bold(size: 20, color: AppColors.textPrimary),
            ),

            verticalSpace(AppSpacing.s16),

            Wrap(
              spacing: AppSpacing.s12,
              runSpacing: AppSpacing.s12,
              children: [
                ExperienceLevelChip(
                  title: 'Intern',
                  isSelected: state.experienceLevel == ExperienceLevel.intern,
                  onTap: () =>
                      cubit.changeExperienceLevel(ExperienceLevel.intern),
                ),

                ExperienceLevelChip(
                  title: 'Junior',
                  isSelected: state.experienceLevel == ExperienceLevel.junior,
                  onTap: () =>
                      cubit.changeExperienceLevel(ExperienceLevel.junior),
                ),

                ExperienceLevelChip(
                  title: 'Mid',
                  isSelected: state.experienceLevel == ExperienceLevel.mid,
                  onTap: () => cubit.changeExperienceLevel(ExperienceLevel.mid),
                ),

                ExperienceLevelChip(
                  title: 'Senior',
                  isSelected: state.experienceLevel == ExperienceLevel.senior,
                  onTap: () =>
                      cubit.changeExperienceLevel(ExperienceLevel.senior),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
