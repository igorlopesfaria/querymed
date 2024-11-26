import 'package:features_login/di/login_module.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(initializerName: 'initLoginGetIt')
Future<void> configureFeaturesLoginDependencies(GetIt getIt) async =>
    getIt.initLoginGetIt();
