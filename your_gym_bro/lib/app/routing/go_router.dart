import 'package:go_router/go_router.dart';
import 'package:your_gym_bro/app/routing/routes/user_connection_routes.dart';
import 'package:your_gym_bro/features/user_connection/splash_page.dart';

var routers = GoRouter(
  initialLocation: SplashPage.routePath,
  routes: [...userConnectionRoute],
);
