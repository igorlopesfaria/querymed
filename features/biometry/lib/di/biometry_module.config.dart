// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:commons_crash_report/i_crash_reporter.dart' as _i978;
import 'package:features_biometry/data/biometry_repository.dart' as _i112;
import 'package:features_biometry/data/datasource/biometry_local_datasource.dart'
    as _i1050;
import 'package:features_biometry/data/datasource/i_biometry_local_datasource.dart'
    as _i127;
import 'package:features_biometry/domain/repository/i_biometry_repository.dart'
    as _i944;
import 'package:features_biometry/domain/usecase/find_ask_biometry_usecase.dart'
    as _i427;
import 'package:features_biometry/domain/usecase/find_use_biometry_usecase.dart'
    as _i233;
import 'package:features_biometry/domain/usecase/insert_ask_biometry_usecase.dart'
    as _i69;
import 'package:features_biometry/domain/usecase/insert_use_biometry_usecase.dart'
    as _i626;
import 'package:features_biometry/presentation/bloc/biometry_register_cubit.dart'
    as _i341;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initFeaturesBiometryGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i127.IBiometryLocalDataSource>(
        () => _i1050.BiometryLocalDataSource(
              gh<_i558.FlutterSecureStorage>(),
              gh<_i978.ICrashReport>(),
            ));
    gh.factory<_i944.IBiometryRepository>(
        () => _i112.BiometryRepository(gh<_i127.IBiometryLocalDataSource>()));
    gh.factory<_i233.FindUseBiometryUseCase>(
        () => _i233.FindUseBiometryUseCase(gh<_i944.IBiometryRepository>()));
    gh.factory<_i626.InsertUseBiometryUseCase>(
        () => _i626.InsertUseBiometryUseCase(gh<_i944.IBiometryRepository>()));
    gh.factory<_i69.InsertAskBiometryUseCase>(
        () => _i69.InsertAskBiometryUseCase(gh<_i944.IBiometryRepository>()));
    gh.factory<_i427.FindAskBiometryUseCase>(
        () => _i427.FindAskBiometryUseCase(gh<_i944.IBiometryRepository>()));
    gh.factory<_i341.BiometryRegisterCubit>(() =>
        _i341.BiometryRegisterCubit(gh<_i626.InsertUseBiometryUseCase>()));
    return this;
  }
}
