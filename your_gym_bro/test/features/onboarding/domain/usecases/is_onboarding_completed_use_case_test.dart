import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:your_gym_bro/features/onboarding/domain/usecases/is_onboarding_completed_use_case.dart';

import '../../onboarding_test_mocks.mocks.dart';

void main() {
  late MockOnboardingRepository repository;
  late IsOnboardingCompletedUseCase useCase;

  setUp(() {
    repository = MockOnboardingRepository();
    useCase = IsOnboardingCompletedUseCase(repository);
  });

  group('IsOnboardingCompletedUseCase', () {
    test('returns repository onboarding completion state', () async {
      when(repository.isOnboardingCompleted()).thenAnswer((_) async => false);

      final result = await useCase();

      expect(result, false);
      verify(repository.isOnboardingCompleted()).called(1);
    });
  });
}
