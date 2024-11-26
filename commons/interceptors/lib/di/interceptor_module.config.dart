// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:commons_interceptors/interceptors/logger/i_logger_interceptor.dart'
    as _i669;
import 'package:commons_interceptors/interceptors/logger/logger_interceptor.dart'
    as _i198;
import 'package:commons_interceptors/interceptors/oauth/i_oauth_interceptor.dart'
    as _i944;
import 'package:commons_interceptors/interceptors/oauth/oauth_interceptor.dart'
    as _i1052;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initCommonsInterceptorGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i669.ILoggerInterceptor>(() => _i198.LoggerInterceptor());
    gh.factory<_i944.IOAuthInterceptor>(() => _i1052.OAuthInterceptor());
    return this;
  }
}
