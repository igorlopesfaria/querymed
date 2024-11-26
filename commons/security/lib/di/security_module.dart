import 'package:commons_security/di/security_module.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(initializerName: 'initCommonsSecurityGetIt')
Future<void> configureCommonsSecurityDependencies(GetIt getIt) async =>
    getIt.initCommonsSecurityGetIt();
