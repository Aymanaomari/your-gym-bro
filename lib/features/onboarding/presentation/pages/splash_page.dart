import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:your_gym_bro/core/constants/assets.dart';
import 'package:your_gym_bro/core/constants/spacing.dart';
import 'package:your_gym_bro/core/i18n/internationalization_extension.dart';
import 'package:your_gym_bro/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:your_gym_bro/theme/ygb_v0_theme/ygb_v0_theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const String routeName = "splash";
  static const String routePath = "/";
  static const String routeDisplayName = "Splash";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    _fadeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _onFadeInCompleted();
      }
    });

    _fadeController.forward();
  }

  void _onFadeInCompleted() {
    context.pushReplacement(OnboardingPage.routePath);
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.bgImage),
            fit: BoxFit.cover,
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: Spacing.sm,
              children: [
                Text(
                  context.tr("your_gym"),
                  style: theme.textTheme.displayMedium?.copyWith(
                    color: theme.ygbColors.primary50,
                  ),
                ),
                Text(
                  "Bro",
                  style: theme.textTheme.displayMedium?.copyWith(
                    color: theme.ygbColors.primary500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
