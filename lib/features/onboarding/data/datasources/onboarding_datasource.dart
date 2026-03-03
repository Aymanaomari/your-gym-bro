import 'package:your_gym_bro/core/constants/storage_keys.dart';
import 'package:your_gym_bro/core/logger/core_logger.dart';
import 'package:your_gym_bro/core/storage/core_storage.dart';

class OnboardingDatasource {
  OnboardingDatasource({
    required CoreStorage storage,
    required CoreLogger logger,
  }) : _storage = storage,
       _logger = logger;

  final CoreStorage _storage;
  final CoreLogger _logger;

  Future<bool> isOnboardingCompleted() async {
    final result = await _storage.getBool(StorageKeys.onboardingCompleted);
    _logger.log('Onboarding completed: $result');
    return result ?? false;
  }

  Future<void> markOnboardingAsCompleted() async {
    await _storage.setBool(StorageKeys.onboardingCompleted, true);
    _logger.log('Onboarding marked as completed');
  }
}
