// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:commons_crash_report/i_crash_reporter.dart' as _i978;
import 'package:dio/dio.dart' as _i361;
import 'package:features_force_update/data/datasource/api/force_update_api_datasource.dart'
    as _i993;
import 'package:features_force_update/data/datasource/api/i_force_update_api_datasource.dart'
    as _i678;
import 'package:features_force_update/data/force_update_repository.dart'
    as _i229;
import 'package:features_force_update/domain/repository/i_force_update_repository.dart'
    as _i240;
import 'package:features_force_update/domain/usecase/force_update_check_version_usecase.dart'
    as _i1019;
import 'package:features_force_update/presentation/bloc/force_update_cubit.dart'
    as _i109;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initForceUpdateGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i109.ForceUpdateCubit>(
        () => _i109.ForceUpdateCubit(gh<_i978.ICrashReport>()));
    gh.factory<_i678.IForceUpdateApiDataSource>(
        () => _i993.ForceUpdateApiDataSource(
              gh<_i361.Dio>(),
              gh<_i978.ICrashReport>(),
            ));
    gh.factory<_i240.IForceUpdateRepository>(() =>
        _i229.ForceUpdateRepository(gh<_i678.IForceUpdateApiDataSource>()));
    gh.factory<_i1019.ForceUpdateCheckVersionUseCase>(() =>
        _i1019.ForceUpdateCheckVersionUseCase(
            gh<_i240.IForceUpdateRepository>()));
    return this;
  }
}
