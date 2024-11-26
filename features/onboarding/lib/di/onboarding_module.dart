import 'package:features_onboarding/di/onboarding_module.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(initializerName: 'initOnboardingGetIt')
Future<void> configureFeaturesOnboardingDependencies(GetIt getIt) async =>
    getIt.initOnboardingGetIt();
