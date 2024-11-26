import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:features_force_update/di/force_update_module.config.dart';

@InjectableInit(initializerName: 'initForceUpdateGetIt')
Future<void> configureFeaturesForceUpdateDependencies(GetIt getIt) async =>
    getIt.initForceUpdateGetIt();
