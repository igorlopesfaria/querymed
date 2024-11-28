import 'dart:io';
import 'package:commons_navigation/navigator/common_navigator.dart';
import 'package:commons_navigation/route/common_routes.dart';
import 'package:design_system_components/bottomsheet/bottom_sheet.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.dart';
import 'package:features_biometry/presentation/widget/biometry_register_widget.dart';
import 'package:features_force_update/presentation/widget/force_update_widget.dart';
import 'package:features_help/presentation/widget/help_widget.dart';
import 'package:features_login/presentation/biometry/widget/login_biometry_widget.dart';
import 'package:features_login/presentation/default/widget/login_default_widget.dart';
import 'package:features_onboarding/presentation/splash/widget/onboarding_splash_widget.dart';
import 'package:features_onboarding/presentation/tutorial/widget/onboarding_tutorial_widget.dart';
import 'package:features_onboarding/presentation/initial/widget/onboarding_initial_widget.dart';
import 'package:features_reset_password/presentation/forms/reset_password_forms_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseRouter {
  BaseRouter._();

  static final _instance = BaseRouter._();

  factory BaseRouter() => _instance;

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CommonRoutes.onboardingSplashRoute:
        return _getPageRoute(
            view: const OnboardingSplashWidget(),
            settings: const RouteSettings());
      case CommonRoutes.onboardingTutorialRoute:
        return _getPageRoute(
            view: const OnboardingTutorialWidget(),
            settings: const RouteSettings());
      case CommonRoutes.onboardingInitialRoute:
        return _getPageRoute(
            view: OnboardingInitialWidget(
              clickHelpIcon: (context) {
                showBottomSheetHelp(context);
              },
            ),
            settings: const RouteSettings());
      case CommonRoutes.forceUpdateRoute:
        return _getPageRoute(
            view: ForceUpdateWidget(
              clickHelpIcon: (context) {
                showBottomSheetHelp(context);
              },
            ),
            settings: const RouteSettings());
      case CommonRoutes.loginBiometryRoute:
        return _getPageRoute(
            view: LoginBiometryWidget(
              clickHelpIcon: (context) {
                showBottomSheetHelp(context);
              },
              showBannerError: (context, props) => {
                showBottomSheetError(context, props)
              },

            ),
            settings: settings);
      case CommonRoutes.loginDefaultRoute:
        return _getPageRoute(
            view: LoginDefaultWidget(
              clickHelpIcon: (context) {
                showBottomSheetHelp(context);
              },
              showBannerError: (context, props) => {
                showBottomSheetError(context, props)
              },
            ),
            settings: settings);
      case CommonRoutes.biometryRegisterRoute:
        return _getPageRoute(
            view: BiometryRegisterWidget(
              clickHelpIcon: (context) {
                showBottomSheetHelp(context);
              },
              showBannerError: (context, props) => {
                showBottomSheetError(context, props)
              },
            ),
            settings: settings);
      case CommonRoutes.resetPasswordRoute:
        return _getPageRoute(
            view: ResetPasswordFormsWidget(
              clickHelpIcon: (context) {
                showBottomSheetHelp(context);
              },
              showBannerError: (context, props) => {
                showBottomSheetError(context, props)
              },
            ),
            settings: settings);

      default:
        return _getPageRoute(
            view: Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ),
            settings: settings);
    }
  }

  List<Route> onGenerateInitialRoutes(String initialRoute) {
    return [
      _getPageRoute(
          view: const OnboardingSplashWidget(), settings: const RouteSettings())
    ];
  }

  PageRoute _getPageRoute({
    required Widget view,
    required RouteSettings settings,
    bool fullScreen = false,
  }) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(
        fullscreenDialog: fullScreen,
        builder: (_) => view,
        settings: settings,
      );
    } else {
      return MaterialPageRoute(
        builder: (_) => view,
        settings: settings,
      );
    }
  }

  void showBottomSheetError(
      BuildContext context, DSFeedbackBottomSheetProps props) {
    showDSBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return DSFeedbackBottomSheetWidget(
            title: props.title,
            description: props.description,
            type: props.type,
            buttonText: props.buttonText,
            onButtonPressed: () {
              CommonNavigator.pop(context);
              props.onButtonPressed?.call();
            });
      },
    );
  }

  void showBottomSheetHelp(BuildContext context) {
    showDSBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const HelpWidget();
      },
    );
  }
}
