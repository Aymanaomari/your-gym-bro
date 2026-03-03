import 'package:your_gym_bro/features/onboarding/domain/repositories/onboarding_repository.dart';

class MarkOnboardingAsCompletedUseCase {
  final OnboardingRepository _repository;

  MarkOnboardingAsCompletedUseCase(this._repository);

  Future<void> call() async {
    await _repository.markOnboardingAsCompleted();
  }
}
