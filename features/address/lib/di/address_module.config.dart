// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:commons_crash_report/i_crash_reporter.dart' as _i978;
import 'package:dio/dio.dart' as _i361;
import 'package:features_address/data/crm_state_repository.dart' as _i1037;
import 'package:features_address/data/datasource/api/address_datasource.dart'
    as _i875;
import 'package:features_address/data/datasource/api/i_address_datasource.dart'
    as _i911;
import 'package:features_address/domain/repository/i_address_state_repository.dart'
    as _i766;
import 'package:features_address/domain/usecase/get_address_state_usecase.dart'
    as _i505;
import 'package:features_address/presentation/state/bloc/address_state_list_cubit.dart'
    as _i479;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initFeaturesAddressGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i911.IAddressApiDataSource>(() => _i875.AddressApiDataSource(
          gh<_i361.Dio>(),
          gh<_i978.ICrashReport>(),
        ));
    gh.factory<_i766.IAddressRepository>(
        () => _i1037.AddressRepository(gh<_i911.IAddressApiDataSource>()));
    gh.factory<_i505.GetAddressStateUseCase>(
        () => _i505.GetAddressStateUseCase(gh<_i766.IAddressRepository>()));
    gh.factory<_i479.AddressStateListCubit>(
        () => _i479.AddressStateListCubit(gh<_i505.GetAddressStateUseCase>()));
    return this;
  }
}
