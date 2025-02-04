class CommonRoutes {

  static const notAuthenticatedRoutes = [
    forceUpdateRoute,
    onboardingSplashRoute,
    onboardingInitialRoute,
    loginDefaultRoute,
    contractRoute,
    resetPasswordRoute,
    resetPasswordVerifyCodeRoute,
    resetPasswordUpdateRoute,
    resetPasswordSuccessRoute
  ];

  // force update
  static const String forceUpdateRoute = '/force_update';

  // onboarding
  static const String onboardingSplashRoute = '/onboarding/splash';
  static const String onboardingTutorialRoute = '/onboarding/tutorial';
  static const String onboardingInitialRoute = '/onboarding/initial';

  //register
  static const String registerInitialRoute = '/register/forms/';
  static const String registerUsernameRoute = '/register/forms/name';
  static const String registerPhoneRoute = '/register/forms/phone';
  static const String registerEmailRoute = '/register/forms/email';
  static const String registerPasswordRoute = '/register/forms/email';
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

  // reset password
  static const String resetPasswordRoute = '/resetPassword';
  static const String resetPasswordUsernameRoute = '/resetPassword/username';
  static const String resetPasswordVerifyCodeRoute = '/resetPassword/verifyCode';
  static const String resetPasswordUpdateRoute = '/resetPassword/update';
  static const String resetPasswordSuccessRoute = '/resetPassword/success';

  static const String addressStateRoute = '/address/state';

}

