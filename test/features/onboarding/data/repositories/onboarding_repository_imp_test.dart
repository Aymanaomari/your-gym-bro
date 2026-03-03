import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:your_gym_bro/features/onboarding/data/repositories/onboarding_repository_imp.dart';

import '../../onboarding_test_mocks.mocks.dart';

void main() {
  late MockOnboardingDatasource datasource;
  late OnboardingRepositoryImp repository;

  setUp(() {
    datasource = MockOnboardingDatasource();
    repository = OnboardingRepositoryImp(datasource);
  });

  group('OnboardingRepositoryImp', () {
    test('isOnboardingCompleted delegates to datasource', () async {
      when(datasource.isOnboardingCompleted()).thenAnswer((_) async => true);

      final result = await repository.isOnboardingCompleted();

      expect(result, true);
      verify(datasource.isOnboardingCompleted()).called(1);
    });

    test('markOnboardingAsCompleted delegates to datasource', () async {
      when(datasource.markOnboardingAsCompleted()).thenAnswer((_) async {});

      await repository.markOnboardingAsCompleted();

      verify(datasource.markOnboardingAsCompleted()).called(1);
    });
  });
}
