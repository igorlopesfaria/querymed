import 'package:get_it/get_it.dart';
import 'package:features_help/di/help_module.config.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(initializerName: 'initHelpGetIt')
Future<void> configureFeaturesHelpDependencies(GetIt getIt) async =>
    getIt.initHelpGetIt();
