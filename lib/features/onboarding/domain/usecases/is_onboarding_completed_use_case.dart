import 'package:your_gym_bro/features/onboarding/domain/repositories/onboarding_repository.dart';

class IsOnboardingCompletedUseCase {
  final OnboardingRepository _repository;

  IsOnboardingCompletedUseCase(this._repository);

  Future<bool> call() async {
    return await _repository.isOnboardingCompleted();
  }
}
