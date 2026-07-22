import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import '../../../../core/services/pdf_service/interview_pdf_service.dart';
import '../../domain/entities/interview_pdf_args.dart';

class InterviewPdfPreviewScreen extends StatelessWidget {
  const InterviewPdfPreviewScreen({
    super.key,

    required this.pdfService, required this.args,
  });


  final InterviewPdfArgs args;
  final InterviewPdfService pdfService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Interview Report'),
          centerTitle: true),
      body: PdfPreview(
        build: (_) {
          return pdfService.generate(args: args);
        },

        canChangePageFormat: false,
        canChangeOrientation: false,
        canDebug: false,

        allowPrinting: true,
        allowSharing: true,

        pdfFileName: _buildFileName(),
      ),
    );
  }

  String _buildFileName() {
    final date = args.evaluation.createdAt;

    final formattedDate =
        '${date.year}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';

    return 'interview_pilot_report_$formattedDate.pdf';
  }
}
