import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:your_gym_bro/core/constants/storage_keys.dart';
import 'package:your_gym_bro/features/onboarding/data/datasources/onboarding_datasource.dart';

import '../../onboarding_test_mocks.mocks.dart';

void main() {
  late MockCoreStorage storage;
  late MockCoreLogger logger;
  late OnboardingDatasource datasource;

  setUp(() {
    storage = MockCoreStorage();
    logger = MockCoreLogger();
    datasource = OnboardingDatasource(storage: storage, logger: logger);
  });

  group('OnboardingDatasource', () {
    test(
      'isOnboardingCompleted returns false when stored value is null',
      () async {
        when(
          storage.getBool(StorageKeys.onboardingCompleted),
        ).thenAnswer((_) async => null);

        final result = await datasource.isOnboardingCompleted();

        expect(result, false);
        verify(storage.getBool(StorageKeys.onboardingCompleted)).called(1);
        verify(logger.log('Onboarding completed: null')).called(1);
      },
    );

    test('isOnboardingCompleted returns stored bool value', () async {
      when(
        storage.getBool(StorageKeys.onboardingCompleted),
      ).thenAnswer((_) async => true);

      final result = await datasource.isOnboardingCompleted();

      expect(result, true);
      verify(storage.getBool(StorageKeys.onboardingCompleted)).called(1);
      verify(logger.log('Onboarding completed: true')).called(1);
    });

    test('markOnboardingAsCompleted stores true flag', () async {
      when(
        storage.setBool(StorageKeys.onboardingCompleted, true),
      ).thenAnswer((_) async {});

      await datasource.markOnboardingAsCompleted();

      verify(storage.setBool(StorageKeys.onboardingCompleted, true)).called(1);
      verify(logger.log('Onboarding marked as completed')).called(1);
    });
  });
}
