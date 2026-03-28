import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:your_gym_bro/features/onboarding/domain/usecases/mark_onboarding_as_completed_use_case.dart';

import '../../onboarding_test_mocks.mocks.dart';

void main() {
  late MockOnboardingRepository repository;
  late MarkOnboardingAsCompletedUseCase useCase;

  setUp(() {
    repository = MockOnboardingRepository();
    useCase = MarkOnboardingAsCompletedUseCase(repository);
  });

  group('MarkOnboardingAsCompletedUseCase', () {
    test('calls repository markOnboardingAsCompleted once', () async {
      when(repository.markOnboardingAsCompleted()).thenAnswer((_) async {});

      await useCase();

      verify(repository.markOnboardingAsCompleted()).called(1);
    });
  });
}
