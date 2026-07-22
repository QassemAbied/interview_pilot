class TechnicalScoresEntity {
  final int flutter;

  final int architecture;

  final int problemSolving;

  final int communication;

  final int confidence;

  const TechnicalScoresEntity({
    required this.flutter,
    required this.architecture,
    required this.problemSolving,
    required this.communication,
    required this.confidence,
  });

  static const dummy = TechnicalScoresEntity(
    flutter: 85,
    architecture: 80,
    problemSolving: 82,
    communication: 88,
    confidence: 78,
  );
}