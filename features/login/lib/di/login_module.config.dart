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
import 'package:commons_security/domain/usecase/auth_refresh_token_usecase.dart'
    as _i110;
import 'package:commons_security/domain/usecase/auth_usecase.dart' as _i874;
import 'package:commons_validator/domain/usecase/validate_email_usecase.dart'
    as _i294;
import 'package:commons_validator/domain/usecase/validate_password_usecase.dart'
    as _i683;
import 'package:features_biometry/domain/usecase/find_ask_biometry_usecase.dart'
    as _i427;
import 'package:features_login/presentation/biometry/bloc/login_biometry_cubit.dart'
    as _i90;
import 'package:features_login/presentation/default/bloc/login_default_cubit.dart'
    as _i252;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initLoginGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i252.LoginDefaultCubit>(() => _i252.LoginDefaultCubit(
          gh<_i874.AuthUseCase>(),
          gh<_i427.FindAskBiometryUseCase>(),
          gh<_i294.ValidateEmailUseCase>(),
          gh<_i683.ValidatePasswordUseCase>(),
          gh<_i978.ICrashReport>(),
        ));
    gh.factory<_i90.LoginBiometryCubit>(() => _i90.LoginBiometryCubit(
          gh<_i111.AuthFindCredentialsUseCase>(),
          gh<_i110.AuthRefreshTokenUseCase>(),
          gh<_i978.ICrashReport>(),
        ));
    return this;
  }
}
