import '../../../../feature/interview_chat/data/models/message_model.dart';

class InterviewEvaluationPrompt {
  const InterviewEvaluationPrompt._();

  static String build(List<MessageModel> messages) {
    final conversation = messages
        .map((e) => '${e.sender.toUpperCase()}: ${e.message}')
        .join('\n');

    return '''
You are an expert technical interviewer.

Analyze the following interview.

Return ONLY valid JSON.

{
  "overall_score": 0,
  "overall_feedback": "",

  "technical_scores": {
    "flutter": 0,
    "architecture": 0,
    "problem_solving": 0,
    "communication": 0,
    "confidence": 0
  },

  "strengths": [],
  "weaknesses": [],
  "recommendations": []
}
Give realistic scores from 0 to 100.

Do not leave any field empty.

Return ONLY valid JSON without markdown.

Interview:

$conversation
''';
  }
}
