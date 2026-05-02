import 'package:core/main.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:user_connection/presentation/viewmodel/onboarding_view_model.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, this.onCompleted});

  final ValueChanged<bool>? onCompleted;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final OnboardingViewModel _viewModel;
  bool _hasNotifiedCompletion = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
    _viewModel = CoreDIResolver.getInstance().resolve<OnboardingViewModel>();

    _controller.forward();
    Future<void>.delayed(const Duration(seconds: 2), () async {
      if (!mounted) return;
      await _viewModel.loadOnboardingStatus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool?>(
      valueListenable: _viewModel.isCompleted,
      builder: (context, isCompleted, _) {
        if (!_hasNotifiedCompletion && isCompleted != null) {
          _hasNotifiedCompletion = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            widget.onCompleted?.call(isCompleted);
          });
        }

        return FadeTransition(
          opacity: _fadeAnimation,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'your_gym'.tr(),
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(width: 12),
                Text(
                  'Bro'.tr(),
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Theme.of(context).ygbColors.primary500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
