import 'package:get_it/get_it.dart';
import '../../feature/resumes/data/data_source/resume_remote_data_source.dart';
import '../../feature/resumes/data/data_source/resume_remote_data_source_impl.dart';
import '../../feature/resumes/data/resume_repository_impl.dart';
import '../../feature/resumes/data/services/resume_ai_service.dart';
import '../../feature/resumes/domain/resume_repository.dart';
import '../../feature/resumes/domain/use_cases/analyze_resume_use_case.dart';
import '../../feature/resumes/domain/use_cases/get_all_resume_use_case.dart';
import '../../feature/resumes/presentation/controller/resume_cubit.dart';
import '../services/ai_service/groq_service.dart';
import '../services/pdf_text_extractor_service/pdf_text_extractor.dart';
import '../services/supabase_service/supabase_resume.dart';

void initResumeInjection(GetIt sl) {
  sl.registerLazySingleton<SupABaseResume>(() => SupABaseResume());

  sl.registerLazySingleton<PdfTextExtractorService>(
    () => const PdfTextExtractorService(),
  );
  sl.registerLazySingleton<ResumeAiService>(
    () => ResumeAiService(groqService: sl<GroqService>()),
  );
  sl.registerLazySingleton<ResumeRemoteDataSource>(
    () => ResumeRemoteDataSourceImpl(
      resumeAiService: sl<ResumeAiService>(),
      supABaseResume: sl<SupABaseResume>(),
      pdfTextExtractorService: sl<PdfTextExtractorService>(),
    ),
  );
  sl.registerLazySingleton<ResumeRepository>(
    () => ResumeRepositoryImpl(remoteDataSource: sl<ResumeRemoteDataSource>()),
  );
  sl.registerLazySingleton<AnalyzeResumeUseCase>(
    () => AnalyzeResumeUseCase(sl<ResumeRepository>()),
  );
  sl.registerLazySingleton<GetAllResumeUseCase>(
    () => GetAllResumeUseCase(sl<ResumeRepository>()),
  );
  sl.registerFactory<ResumeCubit>(() => ResumeCubit(sl(), sl()));
}
