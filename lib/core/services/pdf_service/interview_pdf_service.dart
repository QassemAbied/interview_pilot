import 'dart:typed_data';

import 'package:pdf/widgets.dart' as pw;
import '../../../feature/interview_result/domain/entities/interview_pdf_args.dart';
import 'templates/interview_pdf_template.dart';

class InterviewPdfService {
  final InterviewPdfTemplate template;

  const InterviewPdfService({required this.template});

  Future<Uint8List> generate({required InterviewPdfArgs args}) async {
    final document = pw.Document();

    document.addPage(template.build(args: args));

    return document.save();
  }
}
