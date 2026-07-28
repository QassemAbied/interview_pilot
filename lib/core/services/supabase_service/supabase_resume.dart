import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';
import '../../../feature/resumes/data/models/resume_analysis_model.dart';

class SupABaseResume {
  final SupabaseClient supABase = Supabase.instance.client;

  static const String _bucketName = 'resumes';

  Future<String> uploadResume({required String localFilePath}) async {
    final user = supABase.auth.currentUser;

    if (user == null) {
      throw Exception('User is not authenticated');
    }

    final file = File(localFilePath);

    final fileId = const Uuid().v4();

    final storagePath = '${user.id}/$fileId.pdf';

    await supABase.storage
        .from(_bucketName)
        .upload(
          storagePath,
          file,
          fileOptions: const FileOptions(
            contentType: 'application/pdf',
            upsert: false,
          ),
        );

    return storagePath;
  }

  Future<ResumeAnalysisModel> saveAnalysis(ResumeAnalysisModel analysis) async {
    final user = supABase.auth.currentUser;

    if (user == null) {
      throw Exception('User is not authenticated');
    }

    final data = analysis.toJson();

    data.remove('id');
    data.remove('created_at');

    data['user_id'] = user.id;

    final response = await supABase
        .from('resume_analyses')
        .insert(data)
        .select()
        .single();

    return ResumeAnalysisModel.fromJson(response);
  }

  Future<List<ResumeAnalysisModel>> getAllAnalysis() async {
    final user = supABase.auth.currentUser;
    if (user == null) {
      throw Exception('User is not authenticated');
    }
    final response = await supABase
        .from('resume_analyses')
        .select()
        .eq('user_id', user.id)
        .order('created_at', ascending: false);
    return response.map((e) => ResumeAnalysisModel.fromJson(e)).toList();
  }
}
