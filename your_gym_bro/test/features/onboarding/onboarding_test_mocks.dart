import 'package:mockito/annotations.dart';
import 'package:your_gym_bro/core/logger/core_logger.dart';
import 'package:your_gym_bro/core/storage/core_storage.dart';
import 'package:your_gym_bro/features/onboarding/data/datasources/onboarding_datasource.dart';
import 'package:your_gym_bro/features/onboarding/domain/repositories/onboarding_repository.dart';

@GenerateNiceMocks([
  MockSpec<CoreStorage>(),
  MockSpec<CoreLogger>(),
  MockSpec<OnboardingDatasource>(),
  MockSpec<OnboardingRepository>(),
])
void main() {}
