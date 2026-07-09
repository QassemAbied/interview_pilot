import 'package:get_it/get_it.dart';
import 'package:interview_pilot/core/di/app_injection.dart';
import 'auth_injection.dart';

GetIt sl = GetIt.instance;

Future<void> setupInjection() async {
  initAuthInjection(sl);
  initAppInjection(sl);
}
