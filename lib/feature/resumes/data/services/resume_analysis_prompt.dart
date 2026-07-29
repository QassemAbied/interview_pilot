class ResumeAnalysisPrompt {
  const ResumeAnalysisPrompt._();

  static String build({
    required String resumeText,
    required String targetJob,
    String? jobDescription,
  }) {
    final hasJobDescription =
        jobDescription != null && jobDescription.trim().isNotEmpty;

    return '''
You are an expert resumes reviewer and ATS specialist.

Analyze the provided resumes carefully for the target job.

TARGET JOB:
$targetJob

${hasJobDescription ? '''
JOB DESCRIPTION:
$jobDescription
''' : ''}

Return ONLY valid JSON using exactly this structure:

{
  "overall_score": 0,
  "ats_score": 0,
  "job_match_score": ${hasJobDescription ? '0' : 'null'},
  "summary": "",
  "strengths": [],
  "weaknesses": [],
  "missing_keywords": [],
  "recommendations": []
}

SCORING RULES:

- overall_score must be between 0 and 100.
- ats_score must be between 0 and 100.
- job_match_score must be between 0 and 100 when a job description is provided.
- If no job description is provided, job_match_score must be null.

ANALYSIS RULES:

- Analyze only information actually present in the resumes.
- Do not invent skills, experience, education, projects, or achievements.
- Identify meaningful strengths.
- Identify specific weaknesses.
- Identify important missing keywords relevant to the target job.
- Give clear and actionable recommendations.
- Keep the summary concise and useful.
- Do not leave summary empty.
- Return ONLY valid JSON.
- Do not use markdown.
- Do not wrap the JSON in code fences.

RESUME:

$resumeText
''';
  }
}
