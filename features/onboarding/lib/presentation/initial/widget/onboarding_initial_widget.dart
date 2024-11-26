import 'package:commons_navigation/navigator/common_navigator.dart';
import 'package:commons_navigation/route/common_routes.dart';
import 'package:design_system_components/appbar/appbar.dart';
import 'package:design_system_components/button/button.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:features_onboarding/presentation/initial/bloc/onboarding_initial_cubit.dart';
import 'package:features_onboarding/presentation/initial/bloc/onboarding_initial_state.dart';
import 'package:features_onboarding/presentation/initial/string/onboarding_initial_string.dart';

class OnboardingInitialWidget extends StatefulWidget {
  const OnboardingInitialWidget({super.key, required this.clickHelpIcon});

  final void Function(BuildContext) clickHelpIcon;

  @override
  State<OnboardingInitialWidget> createState() => _OnboardingInitialWidget();
}

class _OnboardingInitialWidget extends State<OnboardingInitialWidget> {
  final token = DSTokenProvider().provide();
  final OnboardingInitialCubit cubit = GetIt.I.get<OnboardingInitialCubit>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: token.color.surface,
          appBar: DSAppBarWidget(
            type: DSAppBarType.light,
            menuItem: Icons.support_agent,
            onPressedMenuItem: () => {widget.clickHelpIcon(context)},
          ),
          body: BlocProvider.value(
            value: cubit,
            child: BlocConsumer<OnboardingInitialCubit, OnboardingInitialState>(
              listener: (BuildContext context, state) {},
              builder: (context, state) {
                return SafeArea(
                    child: SizedBox(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: token.spacing.xs),
                                      child:
                                      Image(
                                        image: AssetImage(token.assets.imLogoFull),
                                      )
                                    ),
                                  ])),
                              Expanded(
                                  flex: 0,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                            width: double.infinity,
                                            child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: token.spacing.sm),
                                                child: DSButtonWidget(
                                                    text: OnboardingInitialStrings.register,
                                                    onPressed: () => {
                                                      CommonNavigator.pushNamed(context, CommonRoutes.registerInitialRoute)
                                                    },
                                                    type: DSButtonType.primary))),
                                        Padding(
                                            padding: EdgeInsets.only(top: token.spacing.xxs)),
                                        SizedBox(
                                            width: double.infinity,
                                            child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: token.spacing.sm),
                                                child: DSButtonWidget(
                                                    text:
                                                    OnboardingInitialStrings.enter,
                                                    onPressed: () => {
                                                      CommonNavigator.pushNamed(context, CommonRoutes.loginDefaultRoute)
                                                    },
                                                    type: DSButtonType.outlinedDark
                                                ))),
                                        Padding(padding: EdgeInsets.only(bottom: token.spacing.xs)),
                                      ])),
                            ])));
              },
            ),
          ),
        ));
  }
}
