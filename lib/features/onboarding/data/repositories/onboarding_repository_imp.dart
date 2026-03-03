import 'package:your_gym_bro/features/onboarding/data/datasources/onboarding_datasource.dart';
import 'package:your_gym_bro/features/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImp implements OnboardingRepository {
  OnboardingRepositoryImp(this._datasource);

  final OnboardingDatasource _datasource;

  @override
  Future<bool> isOnboardingCompleted() {
    return _datasource.isOnboardingCompleted();
  }

  @override
  Future<void> markOnboardingAsCompleted() {
    return _datasource.markOnboardingAsCompleted();
  }
}
