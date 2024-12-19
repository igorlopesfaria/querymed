// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:commons_crash_report/i_crash_reporter.dart' as _i978;
import 'package:commons_media_validation/domain/usecase/media_validation_get_token_usecase.dart'
    as _i303;
import 'package:commons_validator/domain/usecase/validate_crm_usecase.dart'
    as _i1061;
import 'package:dio/dio.dart' as _i361;
import 'package:features_reset_password/data/datasource/api/i_reset_password_api_datasource.dart'
    as _i655;
import 'package:features_reset_password/data/datasource/api/reset_password_api_datasource.dart'
    as _i477;
import 'package:features_reset_password/data/reset_password_repository.dart'
    as _i924;
import 'package:features_reset_password/domain/repository/i_reset_password_repository.dart'
    as _i789;
import 'package:features_reset_password/domain/usecase/update_password_usecase.dart'
    as _i971;
import 'package:features_reset_password/presentation/forms/username/bloc/reset_password_forms_username_cubit.dart'
    as _i32;
import 'package:features_reset_password/presentation/forms/verify_code/bloc/reset_password_forms_verify_code_cubit.dart'
    as _i803;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initResetPasswordGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i803.ResetPasswordFormsVerifyCodeCubit>(
        () => _i803.ResetPasswordFormsVerifyCodeCubit());
    gh.factory<_i32.ResetPasswordFormsUsernameCubit>(
        () => _i32.ResetPasswordFormsUsernameCubit(
              gh<_i1061.ValidateCrmUseCase>(),
              gh<_i303.MediaValidationGetTokenUseCase>(),
            ));
    gh.factory<_i655.IResetPasswordApiDataSource>(
        () => _i477.ResetPasswordApiDataSource(
              gh<_i361.Dio>(),
              gh<_i978.ICrashReport>(),
            ));
    gh.factory<_i789.IResetPasswordRepository>(() =>
        _i924.ResetPasswordRepository(gh<_i655.IResetPasswordApiDataSource>()));
    gh.factory<_i971.UpdatePasswordUseCase>(() =>
        _i971.UpdatePasswordUseCase(gh<_i789.IResetPasswordRepository>()));
    return this;
  }
}
