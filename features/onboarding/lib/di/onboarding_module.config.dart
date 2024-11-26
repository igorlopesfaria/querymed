// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:commons_crash_report/i_crash_reporter.dart' as _i978;
import 'package:commons_security/domain/usecase/auth_find_credentials_usecase.dart'
    as _i111;
import 'package:features_force_update/domain/usecase/force_update_check_version_usecase.dart'
    as _i1019;
import 'package:features_onboarding/data/datasource/local/i_onboarding_local_datasource.dart'
    as _i279;
import 'package:features_onboarding/data/datasource/local/onboarding_local_datasource.dart'
    as _i579;
import 'package:features_onboarding/data/onboarding_repository.dart' as _i771;
import 'package:features_onboarding/domain/repository/i_onboarding_repository.dart'
    as _i92;
import 'package:features_onboarding/domain/usecase/onboarding_check_is_first_time_usecase.dart'
    as _i353;
import 'package:features_onboarding/domain/usecase/onboarding_check_update_first_time_usecase.dart'
    as _i44;
import 'package:features_onboarding/presentation/initial/bloc/onboarding_initial_cubit.dart'
    as _i698;
import 'package:features_onboarding/presentation/splash/bloc/onboarding_splash_cubit.dart'
    as _i109;
import 'package:features_onboarding/presentation/tutorial/bloc/onboarding_turorial_cubit.dart'
    as _i869;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initOnboardingGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i698.OnboardingInitialCubit>(
        () => _i698.OnboardingInitialCubit());
    gh.factory<_i279.IOnboardingLocalDataSource>(
        () => _i579.OnboardingLocalDataSource(
              gh<_i558.FlutterSecureStorage>(),
              gh<_i978.ICrashReport>(),
            ));
    gh.factory<_i92.IOnboardingRepository>(() =>
        _i771.OnboardingRepository(gh<_i279.IOnboardingLocalDataSource>()));
    gh.factory<_i353.OnboardingCheckIsFirstTimeUseCase>(() =>
        _i353.OnboardingCheckIsFirstTimeUseCase(
            gh<_i92.IOnboardingRepository>()));
    gh.factory<_i44.OnboardingCheckUpdateFirstTimeUseCase>(() =>
        _i44.OnboardingCheckUpdateFirstTimeUseCase(
            gh<_i92.IOnboardingRepository>()));
    gh.factory<_i869.OnboardingTutorialCubit>(() =>
        _i869.OnboardingTutorialCubit(
            gh<_i44.OnboardingCheckUpdateFirstTimeUseCase>()));
    gh.factory<_i109.OnboardingSplashCubit>(() => _i109.OnboardingSplashCubit(
          gh<_i1019.ForceUpdateCheckVersionUseCase>(),
          gh<_i111.AuthFindCredentialsUseCase>(),
          gh<_i353.OnboardingCheckIsFirstTimeUseCase>(),
        ));
    return this;
  }
}
