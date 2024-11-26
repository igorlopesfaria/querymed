// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:commons_crash_report/i_crash_reporter.dart' as _i978;
import 'package:commons_security/data/auth_repository.dart' as _i815;
import 'package:commons_security/data/datasource/api/auth_api_datasource.dart'
    as _i795;
import 'package:commons_security/data/datasource/api/i_auth_api_datasource.dart'
    as _i710;
import 'package:commons_security/data/datasource/local/auth_local_datasource.dart'
    as _i23;
import 'package:commons_security/data/datasource/local/i_auth_local_datasource.dart'
    as _i771;
import 'package:commons_security/domain/repository/i_auth_repository.dart'
    as _i239;
import 'package:commons_security/domain/usecase/auth_find_credentials_usecase.dart'
    as _i111;
import 'package:commons_security/domain/usecase/auth_refresh_token_usecase.dart'
    as _i110;
import 'package:commons_security/domain/usecase/auth_usecase.dart' as _i874;
import 'package:commons_security/provider/auth_provider.dart' as _i928;
import 'package:commons_security/provider/i_auth_provider.dart' as _i629;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initCommonsSecurityGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i629.IAuthProvider>(() => _i928.AuthProvider());
    gh.factory<_i771.IAuthLocalDataSource>(() => _i23.AuthLocalDataSource(
          gh<_i558.FlutterSecureStorage>(),
          gh<_i978.ICrashReport>(),
        ));
    gh.factory<_i710.IAuthApiDataSource>(() => _i795.AuthApiDataSource(
          gh<_i361.Dio>(),
          gh<_i978.ICrashReport>(),
        ));
    gh.factory<_i239.IAuthRepository>(() => _i815.AuthRepository(
          gh<_i771.IAuthLocalDataSource>(),
          gh<_i710.IAuthApiDataSource>(),
          gh<_i629.IAuthProvider>(),
        ));
    gh.factory<_i874.AuthUseCase>(
        () => _i874.AuthUseCase(gh<_i239.IAuthRepository>()));
    gh.factory<_i110.AuthRefreshTokenUseCase>(
        () => _i110.AuthRefreshTokenUseCase(gh<_i239.IAuthRepository>()));
    gh.factory<_i111.AuthFindCredentialsUseCase>(
        () => _i111.AuthFindCredentialsUseCase(gh<_i239.IAuthRepository>()));
    return this;
  }
}
