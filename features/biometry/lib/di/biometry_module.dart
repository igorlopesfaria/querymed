import 'package:features_biometry/di/biometry_module.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(initializerName: 'initFeaturesBiometryGetIt')
Future<void> configureFeaturesBiometryDependencies(GetIt getIt) async =>
    getIt.initFeaturesBiometryGetIt();
