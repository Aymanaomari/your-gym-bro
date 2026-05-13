import 'package:core/main.dart';
import 'package:user_connection/data/datasource/onboarding_datasource.dart';
import 'package:user_connection/data/repositories/onboarding_repository_imp.dart';
import 'package:user_connection/domain/repository/onboarding_repository.dart';
import 'package:user_connection/domain/usecases/is_onboarding_completed.dart';
import 'package:user_connection/domain/usecases/mark_onboarding_completed.dart';
import 'package:user_connection/presentation/viewmodel/forgot_password_viewmodel.dart';
import 'package:user_connection/presentation/viewmodel/onboarding_view_model.dart';
import 'package:user_connection/presentation/viewmodel/reset_password_viewmodel.dart';
import 'package:user_connection/presentation/viewmodel/signin_view_model.dart';

class UserConnectionModule {
  UserConnectionModule() {
    _init();
  }

  static void _init() {
    _registerDependencies();
  }

  static void _registerDependencies() {
    final di = CoreDIResolver.getInstance();

    // Datasource
    di.registerLazySingleton<OnboardingDatasource>(
      () => OnboardingDatasourceImpl(),
    );

    // Repository (inject datasource)
    di.registerLazySingleton<OnboardingRepository>(
      () => OnboardingRepositoryImp(
        datasource: di.resolve<OnboardingDatasource>(),
      ),
    );

    // Use cases (inject repository)
    di.registerLazySingleton<IsOnboardingCompleted>(
      () =>
          IsOnboardingCompleted(repository: di.resolve<OnboardingRepository>()),
    );

    di.registerLazySingleton<MarkOnboardingAsCompleted>(
      () => MarkOnboardingAsCompleted(
        repository: di.resolve<OnboardingRepository>(),
      ),
    );

    // View model (inject use cases)
    di.registerLazySingleton<OnboardingViewModel>(
      () => OnboardingViewModel(
        isOnboardingCompletedUseCase: di.resolve<IsOnboardingCompleted>(),
        markOnboardingAsCompletedUseCase: di
            .resolve<MarkOnboardingAsCompleted>(),
      ),
    );
    di.registerFactory<SigninViewModel>(() => SigninViewModel());
    di.registerFactory<ForgotPasswordViewmodel>(
      () => ForgotPasswordViewmodel(),
    );
    di.registerFactory<ResetPasswordViewmodel>(() => ResetPasswordViewmodel());
  }
}
