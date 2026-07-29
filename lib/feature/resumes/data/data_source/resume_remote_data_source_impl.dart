import '../../../../core/services/pdf_text_extractor_service/pdf_text_extractor.dart';
import '../../../../core/services/supabase_service/supabase_resume.dart';
import '../../domain/entities/analyze_resume_params.dart';
import '../models/resume_analysis_model.dart';
import '../services/resume_ai_service.dart';
import 'resume_remote_data_source.dart';

class ResumeRemoteDataSourceImpl implements ResumeRemoteDataSource {
  final ResumeAiService resumeAiService;
  final SupABaseResume supABaseResume;
  final PdfTextExtractorService pdfTextExtractorService;

  const ResumeRemoteDataSourceImpl({
    required this.resumeAiService,
    required this.supABaseResume,
    required this.pdfTextExtractorService,
  });

  @override
  Future<ResumeAnalysisModel> analyzeResume(AnalyzeResumeParams params) async {
    final resumeText = await pdfTextExtractorService.extractText(
      params.resume.path,
    );

    if (resumeText.trim().isEmpty) {
      throw Exception('Could not extract text from the selected PDF.');
    }

    final resumeFilePath = await supABaseResume.uploadResume(
      localFilePath: params.resume.path,
    );

    final analysis = await resumeAiService.generateAnalysis(
      resumeText: resumeText,
      resumeFileName: params.resume.name,
      resumeFilePath: resumeFilePath,
      targetJob: params.targetJob,
      jobDescription: params.jobDescription,
    );

    final savedAnalysis = await supABaseResume.saveAnalysis(analysis);

    return savedAnalysis;
  }

  @override
  Future<List<ResumeAnalysisModel>> getAllAnalysis() async {
    return await supABaseResume.getAllAnalysis();
  }
}
