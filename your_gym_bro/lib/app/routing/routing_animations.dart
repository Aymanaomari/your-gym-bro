import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class RoutingAnimations {
  static CustomTransitionPage<void> slidePage({
    required GoRouterState state,
    required Widget child,
    required Offset beginOffset,
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween<Offset>(
          begin: beginOffset,
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}
