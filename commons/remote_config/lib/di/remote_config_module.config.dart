import 'package:commons_remote_config/di/remote_config_module.config.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(initializerName: 'initRemoteConfigGetIt')
Future<void> configureCommonsRemoteConfigDependencies(GetIt getIt) async =>
    getIt.initRemoteConfigGetIt();
