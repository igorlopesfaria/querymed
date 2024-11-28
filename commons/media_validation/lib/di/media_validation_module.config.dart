// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:commons_crash_report/i_crash_reporter.dart' as _i978;
import 'package:commons_media_validation/data/datasource/api/i_media_validation_api_datasource.dart'
    as _i646;
import 'package:commons_media_validation/data/datasource/api/media_validation_api_datasource.dart'
    as _i580;
import 'package:commons_media_validation/data/media_validation_repository.dart'
    as _i1029;
import 'package:commons_media_validation/domain/repository/i_media_validation_repository.dart'
    as _i808;
import 'package:commons_media_validation/domain/usecase/media_validation_get_token_usecase.dart'
    as _i303;
import 'package:commons_media_validation/domain/usecase/media_validation_verify_code_usecase.dart'
    as _i215;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initCommonsMediaValidationGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i646.IMediaValidationApiDataSource>(
        () => _i580.MediaValidationApiDataSource(
              gh<_i361.Dio>(),
              gh<_i978.ICrashReport>(),
            ));
    gh.factory<_i808.IMediaValidationRepository>(() =>
        _i1029.MediaValidationRepository(
            gh<_i646.IMediaValidationApiDataSource>()));
    gh.factory<_i303.MediaValidationGetTokenUseCase>(() =>
        _i303.MediaValidationGetTokenUseCase(
            gh<_i808.IMediaValidationRepository>()));
    gh.factory<_i215.MediaValidationVerifyCodeUseCase>(() =>
        _i215.MediaValidationVerifyCodeUseCase(
            gh<_i808.IMediaValidationRepository>()));
    return this;
  }
}
