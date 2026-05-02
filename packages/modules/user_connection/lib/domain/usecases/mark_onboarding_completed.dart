import 'package:core/main.dart';
import 'package:user_connection/domain/repository/onboarding_repository.dart';

class MarkOnboardingAsCompleted {
  MarkOnboardingAsCompleted({required OnboardingRepository repository})
    : _repository = repository;

  final OnboardingRepository _repository;

  Future<void> call() async {
    return await _repository.markOnboardingAsCompleted();
  }
}
