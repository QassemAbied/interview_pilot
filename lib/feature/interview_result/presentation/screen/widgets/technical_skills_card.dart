import 'package:flutter/material.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../../domain/entities/technical_scores_entity.dart';
import 'skill_progress_tile.dart';

class TechnicalSkillsCard extends StatelessWidget {
  const TechnicalSkillsCard({
    super.key,
    required this.scores,
    this.isInsideHero = false,
  });

  final TechnicalScoresEntity scores;
  final bool isInsideHero;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkillProgressTile(title: "Flutter", score: scores.flutter),

        verticalSpace(20),

        SkillProgressTile(title: "Architecture", score: scores.architecture),

        verticalSpace(20),

        SkillProgressTile(
          title: "Problem Solving",
          score: scores.problemSolving,
        ),

        verticalSpace(20),

        SkillProgressTile(title: "Communication", score: scores.communication),

        verticalSpace(20),

        SkillProgressTile(title: "Confidence", score: scores.confidence),
      ],
    );
  }
}
