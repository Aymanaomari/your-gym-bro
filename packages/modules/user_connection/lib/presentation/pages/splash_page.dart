import 'package:core/main.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;

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

    _controller.forward();
    Future<void>.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      widget.onCompleted?.call();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
  }
}
