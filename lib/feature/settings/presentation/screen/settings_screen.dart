import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilot/feature/settings/presentation/screen/widget/ai_personality_bottom_sheet.dart';
import 'package:interview_pilot/feature/settings/presentation/screen/widget/logout_button.dart';
import 'package:interview_pilot/feature/settings/presentation/screen/widget/profile_card.dart';
import 'package:interview_pilot/feature/settings/presentation/screen/widget/settings_data.dart';
import 'package:interview_pilot/feature/settings/presentation/screen/widget/settings_section_title.dart';
import '../../../../core/widgets/spacing.dart';
import '../../../auth/presentation/controller/auth_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ProfileCard(),
          verticalSpace(24),
          AiCard(),
          verticalSpace(24),
          ...SettingsData.sections.map(
            (section) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: SettingsSection(section: section),
            ),
          ),
          LogoutButton(
            onPressed: () {
              context.read<AuthCubit>().signOut();
            },
          ),
          verticalSpace(24),
        ],
      ),
    );
  }
}
