import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:interview_pilot/app/app.dart';
import 'core/di/injection_container.dart';
import 'core/services/supabase_service/supabase_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await SupAbaseInitialization.init();
  await setupInjection();

  runApp(const App());
}

