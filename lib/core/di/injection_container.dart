import 'package:get_it/get_it.dart';
import 'package:interview_pilot/core/di/app_injection.dart';
import 'package:interview_pilot/core/di/message_injection.dart';
import 'ai_injection.dart';
import 'auth_injection.dart';
import 'history_injection.dart';
import 'home_injection.dart';
import 'interview_injection.dart';
import 'interview_result_injection.dart';

GetIt sl = GetIt.instance;

Future<void> setupInjection() async {
  initAuthInjection(sl);
  initAppInjection(sl);
  initHomeInjection(sl);
  initInterviewInjection(sl);
  initAiInjection(sl);
  messageInjection(sl);
  initInterviewResultInjection(sl);
  initHistoryInjection(sl);
}
