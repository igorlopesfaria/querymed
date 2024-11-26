class CommonRoutes {

  static const notAuthenticatedRoutes = [
    forceUpdateRoute,
    onboardingSplashRoute,
    onboardingInitialRoute,
    registerInitialRoute,
    contractRoute
  ];

  // force update
  static const String forceUpdateRoute = '/force_update';

  // onboarding
  static const String onboardingSplashRoute = '/onboarding/splash';
  static const String onboardingTutorialRoute = '/onboarding/tutorial';
  static const String onboardingInitialRoute = '/onboarding/initial';

  //register
  static const String registerInitialRoute = '/register/forms';
  static const String registerSuccessRoute = '/register/success';

  //login
  static const String loginDefaultRoute = '/login/default';
  static const String loginBiometryRoute = '/login/biometry';
  
  //biometry
  static const String biometryRegisterRoute = '/biometry/register';

  //contract
  static const String contractRoute = '/register/terms';

  //home
  static const String homeRoute = '/home';

}

