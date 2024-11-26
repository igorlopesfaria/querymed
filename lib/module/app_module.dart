import 'package:commons_core/setup/environment.dart' as commons;
import 'package:commons_core/setup/base_setup.dart';
import 'package:commons_interceptors/interceptors/logger/i_logger_interceptor.dart';
import 'package:commons_interceptors/interceptors/oauth/i_oauth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  Dio get dio => Dio(BaseOptions(baseUrl: BaseSetup.env.baseUrl))
    ..interceptors.addAll([
      GetIt.instance<IOAuthInterceptor>(),
      if (BaseSetup.env != commons.Environment.prod) {
        GetIt.instance<ILoggerInterceptor>()
      }.first
  ]);

  @injectable
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage(
        aOptions: AndroidOptions(
          encryptedSharedPreferences: true,
        ),
      );
}
