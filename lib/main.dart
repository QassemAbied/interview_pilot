import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:interview_pilot/app/app.dart';
import 'core/di/injection_container.dart';
import 'core/services/supabase_service/supabase_init.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  debugPrint("URL = ${dotenv.env['SUPABASE_URL']}");
  debugPrint("KEY EXISTS = ${dotenv.env['SUPABASE_ANON_KEY'] != null}");
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SupAbaseInitialization.init();
  await setupInjection();

  runApp(const App());
}
