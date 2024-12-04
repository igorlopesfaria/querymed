import 'package:commons_navigation/navigator/common_navigator.dart';
import 'package:commons_navigation/route/common_routes.dart';
import 'package:features_onboarding/presentation/splash/bloc/onboarding_splash_cubit.dart';
import 'package:features_onboarding/presentation/splash/bloc/onboarding_splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';

class OnboardingSplashWidget extends StatefulWidget {

  const OnboardingSplashWidget({super.key});

  @override
  State<OnboardingSplashWidget> createState() => _OnboardingSplashWidget();
}

class _OnboardingSplashWidget extends State<OnboardingSplashWidget> {
  final OnboardingSplashCubit cubit = GetIt.I.get<OnboardingSplashCubit>();
  final token = DSTokenProvider().provide();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: token.color.surface,
        body: BlocProvider.value(
            value: cubit..checkUpdateAndFindCredentials(),
            child: BlocConsumer<OnboardingSplashCubit, OnboardingSplashState>(
                listener: (BuildContext context, state) {
                  String? route;

                  if (state is OnboardingSplashUserRegisteredState) {
                    route = CommonRoutes.homeRoute;
                  } else if (state is OnboardingSplashForceUpdateState) {
                    route = CommonRoutes.forceUpdateRoute;
                  } else if (state is OnboardingSplashUserNotRegisteredState) {
                    route = state.isFirstAccess
                        ? CommonRoutes.onboardingTutorialRoute
                        : CommonRoutes.addressStateRoute; //CommonRoutes.onboardingInitialRoute;
                  }

                  if (route != null) {
                    CommonNavigator.pushReplacementNamed(context, route);
                  }
                }, builder: (context, state) {
                  return  SizedBox(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child:
                                  Image(
                                    image: AssetImage(
                                      token.assets.imLogoFull,
                                    ),
                                  ),
                                )
                            ),

                          ])
                  );
                })
            )
    );
  }
}