import 'package:go_router/go_router.dart';
import 'package:your_gym_bro/features/auth/presentation/pages/singin_page.dart';

final authenticationRoutes = [
  GoRoute(
    path: SinginPage.routePath,
    name: SinginPage.routeName,
    builder: (context, state) => const SinginPage(),
  ),
];
