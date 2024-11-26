import 'package:commons_interceptors/di/interceptor_module.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(initializerName: 'initCommonsInterceptorGetIt')
Future<void> configureCommonsInterceptorDependencies(
    GetIt getIt) async =>
    getIt.initCommonsInterceptorGetIt();
