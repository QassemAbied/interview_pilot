class SkillPerformanceEntity {
  final String name;
  final int score;

  const SkillPerformanceEntity({
    required this.name,
    required this.score,
  });

  static final dummy = SkillPerformanceEntity(
    name: 'Flutter',
    score: 88,
  );
}