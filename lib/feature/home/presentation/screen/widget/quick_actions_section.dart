import 'package:flutter/material.dart';
import '../../../../../core/constants/app_spac.dart';
import '../../models/quick_action_model.dart';
import 'quick_action_item.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key, required this.actions});

  final List<QuickActionModel> actions;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(AppSpacing.s16),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return QuickActionItem(action: actions[index]);
        }, childCount: actions.length),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.15,
        ),
      ),
    );
  }
}
