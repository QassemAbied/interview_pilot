import 'package:go_router/go_router.dart';
import 'package:interview_pilot/core/routing/route_names.dart';
import 'package:interview_pilot/core/routing/routes.dart';



class AppRouter {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: RoutePath.splash,

    routes: AppRoutes.routes,
  );
}
