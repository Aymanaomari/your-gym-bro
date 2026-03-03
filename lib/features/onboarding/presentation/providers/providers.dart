import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_gym_bro/app/app_providers.dart';
import 'package:your_gym_bro/features/onboarding/data/datasources/onboarding_datasource.dart';
import 'package:your_gym_bro/features/onboarding/data/repositories/onboarding_repository_imp.dart';
import 'package:your_gym_bro/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:your_gym_bro/features/onboarding/domain/usecases/is_onboarding_completed_use_case.dart';
import 'package:your_gym_bro/features/onboarding/domain/usecases/mark_onboarding_as_completed_use_case.dart';

final onboardingDatasourceProvider = FutureProvider<OnboardingDatasource>((
  ref,
) async {
  final storage = await ref.watch(storageProvider.future);
  final logger = ref.read(loggerProvider('OnboardingDatasource'));

  return OnboardingDatasource(storage: storage, logger: logger);
});

final onboardingRepositoryProvider = FutureProvider<OnboardingRepository>((
  ref,
) async {
  final datasource = await ref.watch(onboardingDatasourceProvider.future);
  return OnboardingRepositoryImp(datasource);
});

final isOnboardingCompletedUseCaseProvider =
    FutureProvider<IsOnboardingCompletedUseCase>((ref) async {
      final repository = await ref.watch(onboardingRepositoryProvider.future);
      return IsOnboardingCompletedUseCase(repository);
    });

final markOnboardingAsCompletedUseCaseProvider =
    FutureProvider<MarkOnboardingAsCompletedUseCase>((ref) async {
      final repository = await ref.watch(onboardingRepositoryProvider.future);
      return MarkOnboardingAsCompletedUseCase(repository);
    });
