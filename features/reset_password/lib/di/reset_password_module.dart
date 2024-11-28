import 'package:features_reset_password/di/reset_password_module.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(initializerName: 'initResetPasswordGetIt')
Future<void> configureFeaturesResetPasswordDependencies(GetIt getIt) async =>
    getIt.initResetPasswordGetIt();
