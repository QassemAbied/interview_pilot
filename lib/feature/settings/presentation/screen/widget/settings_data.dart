import 'package:flutter/material.dart';
import '../../../../../core/routing/route_names.dart';
import '../models/setting_item.dart';
import '../models/settings_section_model.dart';

abstract class SettingsData {
  const SettingsData._();

  static List<SettingsSectionModel> sections = [
    SettingsSectionModel(
      title: 'Account',
      items: [
        SettingItem(
          title: 'Edit Profile',
          subtitle: 'Name, photo and bio',
          icon: Icons.person_outline_rounded,
          routeName: RouteNames.profile,
        ),
        SettingItem(
          title: 'Resume',
          subtitle: 'Manage your resume',
          icon: Icons.description_outlined,
          routeName: RouteNames.resumeAnalysis,
        ),
        SettingItem(
          title: 'Change Password',
          icon: Icons.lock_outline_rounded,
          showDivider: false,
          routeName: RouteNames.forgetPassword,
        ),
      ],
    ),
    SettingsSectionModel(
      title: 'Interview',
      items: [
        SettingItem(
          title: 'Preferred Role',
          subtitle: 'Flutter Developer',
          icon: Icons.badge_outlined,
        ),
        SettingItem(
          title: 'Experience Level',
          subtitle: 'Junior',
          icon: Icons.workspace_premium_outlined,
        ),
        SettingItem(
          title: 'Duration',
          subtitle: '30 Minutes',
          icon: Icons.schedule_outlined,
          showDivider: false,
        ),
      ],
    ),
    SettingsSectionModel(
      title: 'Appearance',
      items: [
        SettingItem(
          title: 'Theme',
          subtitle: 'Light',
          icon: Icons.palette_outlined,
        ),
        SettingItem(
          title: 'Language',
          subtitle: 'English',
          icon: Icons.language_rounded,
          showDivider: false,
        ),
      ],
    ),
    SettingsSectionModel(
      title: 'About',
      items: [
        SettingItem(
          title: 'Contact Support',
          icon: Icons.support_agent_outlined,
        ),
        SettingItem(title: 'Rate App', icon: Icons.star_border_rounded),
        SettingItem(title: 'Privacy Policy', icon: Icons.privacy_tip_outlined),
        SettingItem(
          title: 'Delete Account',
          icon: Icons.delete_outline_rounded,
          isDestructive: true,
          showDivider: false,
        ),
      ],
    ),
  ];
}
