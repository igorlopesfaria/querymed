// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:commons_remote_config/data/remote_config_repository.dart'
    as _i409;
import 'package:commons_remote_config/data/service/i_remote_config_service.dart'
    as _i718;
import 'package:commons_remote_config/data/service/remote_config_service.dart'
    as _i324;
import 'package:commons_remote_config/domain/repository/i_remote_config_repository.dart'
    as _i220;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initRemoteConfigGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i718.IRemoteConfigService>(() => _i324.RemoteConfigService());
    gh.factory<_i220.IRemoteConfigRepository>(
        () => _i409.RemoteConfigRepository(gh<_i718.IRemoteConfigService>()));
    return this;
  }
}
