import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:commons_validator/di/validator_module.config.dart';

@InjectableInit(initializerName: 'initCommonsValidatorGetIt')
Future<void> configureCommonsValidatorDependencies(GetIt getIt) async =>
    getIt.initCommonsValidatorGetIt();
