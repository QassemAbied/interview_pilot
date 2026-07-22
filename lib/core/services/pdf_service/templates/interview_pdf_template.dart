import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../feature/interview/domain/entities/interview_entity.dart';
import '../../../../feature/interview_result/domain/entities/interview_evaluation_entity.dart';
import '../../../../feature/interview_result/domain/entities/interview_pdf_args.dart';

class InterviewPdfTemplate {
  const InterviewPdfTemplate();

  pw.MultiPage build({
    required InterviewPdfArgs args,
  }) {
    return pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.symmetric(horizontal: 32, vertical: 36),
      build: (context) {
        return [
          _buildHeader(evaluation: args.evaluation),

          pw.SizedBox(height: 30),

          _buildInterviewDetails(interview: args.interview),
          pw.SizedBox(height: 24),
          _buildScore(args.evaluation.overallScore),

          pw.SizedBox(height: 30),

          _buildTechnicalSkills(args.evaluation),

          pw.SizedBox(height: 28),

          _buildTextSection(
            title: 'AI Summary',
            text: args.evaluation.overallFeedback,
          ),

          pw.SizedBox(height: 28),

          _buildListSection(title: 'Strengths', items: args.evaluation.strengths),

          pw.SizedBox(height: 28),

          _buildListSection(
            title: 'Areas to Improve',
            items: args.evaluation.weaknesses,
          ),

          pw.SizedBox(height: 28),

          _buildListSection(
            title: 'Recommendations',
            items: args.evaluation.recommendations
          ),

          pw.SizedBox(height: 40),

          _buildFooter(),
        ];
      },
    );
  }

  pw.Widget _buildHeader({required InterviewEvaluationEntity evaluation}) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Expanded(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'INTERVIEW PILOT',
                    style: pw.TextStyle(
                      fontSize: 12,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.indigo,
                    ),
                  ),

                  pw.SizedBox(height: 8),

                  pw.Text(
                    'AI Interview Report',
                    style: pw.TextStyle(
                      fontSize: 26,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),

                  pw.SizedBox(height: 6),

                  pw.Text(
                    'Personalized interview performance analysis',
                    style: const pw.TextStyle(
                      fontSize: 11,
                      color: PdfColors.grey700,
                    ),
                  ),
                ],
              ),
            ),

            pw.SizedBox(width: 20),

            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text(
                  'Generated',
                  style: const pw.TextStyle(
                    fontSize: 9,
                    color: PdfColors.grey600,
                  ),
                ),

                pw.SizedBox(height: 4),

                pw.Text(
                  _formatDate(evaluation.createdAt),
                  style: pw.TextStyle(
                    fontSize: 10,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.grey800,
                  ),
                ),
              ],
            ),
          ],
        ),

        pw.SizedBox(height: 20),

        pw.Divider(color: PdfColors.grey300),
      ],
    );
  }

  pw.Widget _buildInterviewDetails({required InterviewEntity interview}) {
    return pw.Container(
      width: double.infinity,
      padding: const pw.EdgeInsets.all(18),
      decoration: pw.BoxDecoration(
        color: PdfColors.grey100,
        borderRadius: pw.BorderRadius.circular(12),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Interview Details',
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          ),

          pw.SizedBox(height: 16),

          _buildDetailRow(label: 'Position', value: interview.jobTitle),

          if (interview.companyName != null &&
              interview.companyName!.trim().isNotEmpty) ...[
            pw.SizedBox(height: 10),

            _buildDetailRow(label: 'Company', value: interview.companyName!),
          ],

          pw.SizedBox(height: 10),

          _buildDetailRow(
            label: 'Interview Type',
            value: _formatEnumName(interview.interviewType.name),
          ),

          pw.SizedBox(height: 10),

          _buildDetailRow(
            label: 'Experience Level',
            value: _formatEnumName(interview.level.name),
          ),

          pw.SizedBox(height: 10),

          _buildDetailRow(
            label: 'Duration',
            value: '${interview.duration} min',
          ),
        ],
      ),
    );
  }

  pw.Widget _buildDetailRow({required String label, required String value}) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.SizedBox(
          width: 110,
          child: pw.Text(
            label,
            style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey600),
          ),
        ),

        pw.Expanded(
          child: pw.Text(
            value,
            style: pw.TextStyle(
              fontSize: 10,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.grey900,
            ),
          ),
        ),
      ],
    );
  }

  String _formatEnumName(String value) {
    return value
        .replaceAllMapped(RegExp(r'([A-Z])'), (match) => ' ${match.group(1)}')
        .trim()
        .split(' ')
        .map((word) => '${word[0].toUpperCase()}${word.substring(1)}')
        .join(' ');
  }

  pw.Widget _buildScore(int score) {
    return pw.Container(
      width: double.infinity,
      padding: const pw.EdgeInsets.all(24),
      decoration: pw.BoxDecoration(
        color: PdfColors.indigo50,
        borderRadius: pw.BorderRadius.circular(12),
      ),
      child: pw.Column(
        children: [
          pw.Text(
            'OVERALL SCORE',
            style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey700),
          ),

          pw.SizedBox(height: 10),

          pw.Text(
            '$score / 100',
            style: pw.TextStyle(
              fontSize: 32,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.indigo,
            ),
          ),

          pw.SizedBox(height: 6),

          pw.Text(
            _scoreTitle(score),
            style: pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold),
          ),
        ],
      ),
    );
  }

  pw.Widget _buildTechnicalSkills(InterviewEvaluationEntity evaluation) {
    final scores = evaluation.technicalScores;

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Technical Skills'),

        pw.SizedBox(height: 16),

        _buildSkill(title: 'Flutter', score: scores.flutter),

        _buildSkill(title: 'Architecture', score: scores.architecture),

        _buildSkill(title: 'Problem Solving', score: scores.problemSolving),

        _buildSkill(title: 'Communication', score: scores.communication),

        _buildSkill(title: 'Confidence', score: scores.confidence),
      ],
    );
  }

  pw.Widget _buildSkill({required String title, required int score}) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 12),
      child: pw.Column(
        children: [
          pw.Row(
            children: [
              pw.Expanded(
                child: pw.Text(
                  title,
                  style: pw.TextStyle(
                    fontSize: 11,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),

              pw.Text(
                '$score%',
                style: pw.TextStyle(
                  fontSize: 11,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.indigo,
                ),
              ),
            ],
          ),

          pw.SizedBox(height: 6),

          _buildProgressBar(score),
        ],
      ),
    );
  }

  pw.Widget _buildProgressBar(int score) {
    final safeScore = score.clamp(0, 100);

    return pw.Container(
      height: 6,
      decoration: pw.BoxDecoration(
        color: PdfColors.grey200,
        borderRadius: pw.BorderRadius.circular(10),
      ),
      child: pw.Row(
        children: [
          if (safeScore > 0)
            pw.Expanded(
              flex: safeScore,
              child: pw.Container(
                decoration: pw.BoxDecoration(
                  color: PdfColors.indigo,
                  borderRadius: pw.BorderRadius.circular(10),
                ),
              ),
            ),

          if (safeScore < 100)
            pw.Expanded(flex: 100 - safeScore, child: pw.SizedBox()),
        ],
      ),
    );
  }

  pw.Widget _buildTextSection({required String title, required String text}) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(title),

        pw.SizedBox(height: 12),

        pw.Text(
          text,
          style: const pw.TextStyle(
            fontSize: 11,
            lineSpacing: 4,
            color: PdfColors.grey800,
          ),
        ),
      ],
    );
  }

  pw.Widget _buildListSection({
    required String title,
    required List<String> items,
  }) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(title),

        pw.SizedBox(height: 12),

        ...items.map(
          (item) => pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 9),
            child: pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Container(
                  width: 5,
                  height: 5,
                  margin: const pw.EdgeInsets.only(top: 4),
                  decoration: const pw.BoxDecoration(
                    color: PdfColors.indigo,
                    shape: pw.BoxShape.circle,
                  ),
                ),

                pw.SizedBox(width: 10),

                pw.Expanded(
                  child: pw.Text(
                    item,
                    style: const pw.TextStyle(
                      fontSize: 11,
                      lineSpacing: 3,
                      color: PdfColors.grey800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  pw.Widget _buildSectionTitle(String title) {
    return pw.Text(
      title,
      style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
    );
  }

  pw.Widget _buildFooter() {
    return pw.Column(
      children: [
        pw.Divider(color: PdfColors.grey300),

        pw.SizedBox(height: 10),

        pw.Text(
          'Generated by Interview Pilot AI',
          style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey600),
        ),
      ],
    );
  }

  String _scoreTitle(int score) {
    if (score >= 90) {
      return 'Excellent';
    }

    if (score >= 80) {
      return 'Very Good';
    }

    if (score >= 70) {
      return 'Good';
    }

    if (score >= 60) {
      return 'Fair';
    }

    return 'Needs Improvement';
  }

  String _formatDate(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
