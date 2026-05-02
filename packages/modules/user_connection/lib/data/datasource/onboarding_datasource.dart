import 'package:core/main.dart';

abstract class OnboardingDatasource {
  Future<bool> isOnboardingCompleted();

  Future<void> markOnboardingAsCompleted();
}

class OnboardingDatasourceImpl implements OnboardingDatasource {
  OnboardingDatasourceImpl({required this.cache});

  final CoreCache cache;

  @override
  Future<bool> isOnboardingCompleted() async {
    final result = await cache.getBool("onboarding_completed");
    return result ?? false;
  }

  @override
  Future<void> markOnboardingAsCompleted() async {
    await cache.setBool("onboarding_completed", true);
  }
}
