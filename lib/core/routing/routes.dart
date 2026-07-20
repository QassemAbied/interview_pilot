import 'package:go_router/go_router.dart';
import 'package:interview_pilot/core/routing/route_names.dart';
import 'package:interview_pilot/feature/auth/presentation/screens/forget_password/forget_password_screen.dart';
import 'package:interview_pilot/feature/auth/presentation/screens/register/register_screen.dart';
import 'package:interview_pilot/feature/auth/presentation/screens/rest_password/rest_password_screen.dart';
import 'package:interview_pilot/feature/interview/presentation/screen/interview_setup/interview_setup_screen.dart';
import 'package:interview_pilot/feature/splash_screen.dart';
import '../../feature/auth/presentation/screens/login/login_screen.dart';
import '../../feature/home/presentation/screen/home_screen.dart';
import '../../feature/interview_chat/presentation/screen/interview_chat_screen.dart';

class AppRoutes {
  static List<RouteBase> routes = [
    GoRoute(
      path: RoutePath.splash,
      name: RouteNames.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RoutePath.home,
      name: RouteNames.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: RoutePath.login,
      name: RouteNames.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RoutePath.forgetPassword,
      name: RouteNames.forgetPassword,
      builder: (context, state) => const ForgetPasswordScreen(),
    ),
    GoRoute(
      path: RoutePath.register,
      name: RouteNames.register,
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: RoutePath.restPassword,
      name: RouteNames.restPassword,
      builder: (context, state) => const RestPasswordScreen(),
    ),
    GoRoute(
      path: RoutePath.interviewSetup,
      name: RouteNames.interviewSetup,
      builder: (context, state) => const InterviewSetupScreen(),
    ),
    GoRoute(
      path: '${RoutePath.interview}/:interviewId',
      name: RouteNames.interview,

      builder: (context, state) {
        final interviewId = state.pathParameters['interviewId']!;
       return InterviewChatScreen(interviewId: interviewId);}
    ),
  ];
}
