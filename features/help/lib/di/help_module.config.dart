// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:commons_remote_config/domain/repository/i_remote_config_repository.dart'
    as _i220;
import 'package:get_it/get_it.dart' as _i174;
import 'package:features_help/domain/usecase/get_help_contact_usecase.dart' as _i243;
import 'package:features_help/presentation/bloc/help_cubit.dart' as _i139;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initHelpGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i243.GetHelpContactUseCase>(
        () => _i243.GetHelpContactUseCase(gh<_i220.IRemoteConfigRepository>()));
    gh.factory<_i139.HelpCubit>(() => _i139.HelpCubit(
        getHelpContactUseCase: gh<_i243.GetHelpContactUseCase>()));
    return this;
  }
}
