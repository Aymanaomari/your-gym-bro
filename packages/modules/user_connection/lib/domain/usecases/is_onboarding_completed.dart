import 'package:user_connection/domain/repository/onboarding_repository.dart';

class IsOnboardingCompleted {
  IsOnboardingCompleted({required OnboardingRepository repository})
    : _repository = repository;

  final OnboardingRepository _repository;

  Future<bool> call() async {
    return await _repository.isOnboardingCompleted();
  }
}
