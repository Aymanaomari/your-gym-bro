import 'package:user_connection/data/datasource/onboarding_datasource.dart';
import 'package:user_connection/domain/repository/onboarding_repository.dart';

class OnboardingRepositoryImp implements OnboardingRepository {
  OnboardingRepositoryImp({required this.datasource});

  final OnboardingDatasource datasource;

  @override
  Future<bool> isOnboardingCompleted() async {
    return await datasource.isOnboardingCompleted();
  }

  @override
  Future<void> markOnboardingAsCompleted() async {
    return await datasource.markOnboardingAsCompleted();
  }
}
