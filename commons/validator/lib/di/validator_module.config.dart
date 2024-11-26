// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:commons_crash_report/i_crash_reporter.dart' as _i978;
import 'package:commons_validator/data/datasource/api/i_validator_api_datasrouce.dart'
    as _i196;
import 'package:commons_validator/data/datasource/api/validator_api_datasource.dart'
    as _i556;
import 'package:commons_validator/data/validation_repository.dart' as _i362;
import 'package:commons_validator/domain/repository/i_validator_repository.dart'
    as _i880;
import 'package:commons_validator/domain/usecase/validate_crm_usecase.dart'
    as _i1061;
import 'package:commons_validator/domain/usecase/validate_email_usecase.dart'
    as _i294;
import 'package:commons_validator/domain/usecase/validate_password_usecase.dart'
    as _i683;
import 'package:commons_validator/domain/usecase/validate_phone_usecase.dart'
    as _i569;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initCommonsValidatorGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i196.IValidatorApiDataSource>(
        () => _i556.ValidatorApiDataSource(
              gh<_i361.Dio>(),
              gh<_i978.ICrashReport>(),
            ));
    gh.factory<_i880.IValidatorRepository>(
        () => _i362.ValidatorRepository(gh<_i196.IValidatorApiDataSource>()));
    gh.factory<_i294.ValidateEmailUseCase>(
        () => _i294.ValidateEmailUseCase(gh<_i880.IValidatorRepository>()));
    gh.factory<_i569.ValidatePhoneUseCase>(
        () => _i569.ValidatePhoneUseCase(gh<_i880.IValidatorRepository>()));
    gh.factory<_i1061.ValidateCrmUseCase>(
        () => _i1061.ValidateCrmUseCase(gh<_i880.IValidatorRepository>()));
    gh.factory<_i683.ValidatePasswordUseCase>(
        () => _i683.ValidatePasswordUseCase(gh<_i880.IValidatorRepository>()));
    return this;
  }
}
