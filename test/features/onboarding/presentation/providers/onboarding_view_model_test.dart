import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_gym_bro/features/onboarding/presentation/providers/onboarding_view_mode.dart';

void main() {
  group('OnboardingViewModel', () {
    test('initial state is page 0 with totalPages 2', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final state = container.read(onboardingViewModelProvider);

      expect(state.currentPage, 0);
      expect(state.totalPages, 2);
    });

    test('onPageChanged updates currentPage', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(onboardingViewModelProvider.notifier);
      notifier.onPageChanged(1);

      final state = container.read(onboardingViewModelProvider);
      expect(state.currentPage, 1);
      expect(state.totalPages, 2);
    });

    test('onContinuePressed does nothing on last page', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(onboardingViewModelProvider.notifier);
      notifier.onPageChanged(1);

      await notifier.onContinuePressed();

      final state = container.read(onboardingViewModelProvider);
      expect(state.currentPage, 1);
    });
  });
}
