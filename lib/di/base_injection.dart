
import 'package:appdoctorline/di/base_injection.config.dart';
import 'package:commons_crash_report/di/crash_report_module.dart';
import 'package:commons_interceptors/di/interceptor_module.dart';
import 'package:commons_remote_config/di/remote_config_module.config.dart';
import 'package:commons_security/di/security_module.dart';
import 'package:commons_validator/di/validator_module.dart';
import 'package:features_biometry/di/biometry_module.dart';
import 'package:features_force_update/di/force_update_module.dart';
import 'package:features_help/di/help_module.dart';
import 'package:features_login/di/login_module.dart';
import 'package:features_onboarding/di/onboarding_module.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(initializerName: 'initGetIt')
Future<void> configureDependencies() async {
  GetIt getIt = GetIt.instance;
  await configureCommonsCrashReportDependencies(getIt);
  await configureCommonsInterceptorDependencies(getIt);
  await configureCommonsRemoteConfigDependencies(getIt);
  await configureCommonsSecurityDependencies(getIt);
  await configureCommonsValidatorDependencies(getIt);
  await configureFeaturesBiometryDependencies(getIt);
  await configureFeaturesForceUpdateDependencies(getIt);
  await configureFeaturesOnboardingDependencies(getIt);
  await configureFeaturesHelpDependencies(getIt);
  await configureFeaturesLoginDependencies(getIt);
  getIt.initGetIt();
}