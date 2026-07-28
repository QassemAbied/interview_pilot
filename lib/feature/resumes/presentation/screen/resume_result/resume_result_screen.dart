import 'package:flutter/material.dart';
import 'package:interview_pilot/feature/resumes/presentation/screen/resume_result/resume_result_body.dart';
import '../../../domain/entities/resume_analysis_entity.dart';

class ResumeResultScreen extends StatelessWidget {
  final ResumeAnalysisEntity analysis;

  const ResumeResultScreen({super.key, required this.analysis});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resume Analysis')),
      body: SafeArea(child: ResumeResultBody(analysis: analysis)),
    );
  }
}
