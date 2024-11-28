import 'package:commons_media_validation/di/media_validation_module.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(initializerName: 'initCommonsMediaValidationGetIt')
Future<void> configureCommonsMediaValidationDependencies(GetIt getIt) async =>
    getIt.initCommonsMediaValidationGetIt();