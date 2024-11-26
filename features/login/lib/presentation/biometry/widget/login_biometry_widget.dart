import 'package:commons_navigation/navigator/common_navigator.dart';
import 'package:commons_navigation/route/common_routes.dart';
import 'package:design_system_components/appbar/appbar.dart';
import 'package:design_system_components/button/button.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.dart';
import 'package:design_system_components/snackbar/snackbar.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:features_login/presentation/biometry/bloc/login_biometry_cubit.dart';
import 'package:features_login/presentation/biometry/bloc/login_biometry_state.dart';
import 'package:features_login/presentation/biometry/string/login_biometry_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LoginBiometryWidget extends StatefulWidget {
  const LoginBiometryWidget({super.key,
    required this.clickHelpIcon,
    required this.showBannerError
  });
  final void Function(BuildContext, DSFeedbackBottomSheetProps) showBannerError;
  final void Function(BuildContext) clickHelpIcon;


  @override
  State<LoginBiometryWidget> createState() => _LoginBiometryWidget();
}

class _LoginBiometryWidget extends State<LoginBiometryWidget> {
  final _cubit = GetIt.I.get<LoginBiometryCubit>();
  final _token = DSTokenProvider().provide();

  @override
  void initState() {
    super.initState();
    _cubit.authenticateOS();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _token.color.surface,
        appBar: DSAppBarWidget(
          type: DSAppBarType.light,
          onPressedIconLeading: () => {
            CommonNavigator.canPop(context)
                ? CommonNavigator.pop(context)
                : CommonNavigator.pushReplacementNamed(
                context, CommonRoutes.onboardingInitialRoute)
          },
          iconLeading: Icons.arrow_back,
          menuItem: Icons.support_agent,
          onPressedMenuItem: () => {widget.clickHelpIcon(context)},
        ),
        body: BlocProvider.value(
            value: _cubit,
            child: BlocConsumer<LoginBiometryCubit, LoginBiometryState>(
                listener: (BuildContext context, state) {
              if (state is LoginBiometrySuccessState) {
                CommonNavigator.pushReplacementNamed(context, state.route);
              } else if (state is LoginBiometryBannerErrorState) {
                widget.showBannerError(context, state.bottomSheetProps);
              } else if (state is LoginBiometrySnackErrorState) {
                DSSnackBarWidget.show(
                    context,
                    state.messageError,
                    DSSnackBarType.danger
                );
              }
            }, builder: (context, state) {
              return SafeArea(
                  child: SizedBox(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.symmetric(horizontal: _token.spacing.xs),
                                          child:
                                          Image(
                                            image: AssetImage(_token.assets.imLogo),
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
                                            padding: EdgeInsets.only(
                                                left: _token.spacing.xs,
                                                right: _token.spacing.xs,
                                                bottom: _token.spacing.xxs),
                                            child: DSButtonWidget(
                                                text: LoginBiometryStrings.buttonBiometryLogin,
                                                showLoading: state is LoginBiometryLoadingState,
                                                onPressed: () {
                                                  _cubit.authenticateOS();
                                                },
                                                type: DSButtonType.primary))),
                                    SizedBox(
                                        width: double.infinity,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: _token.spacing.xs,
                                                right: _token.spacing.xs,
                                                bottom: _token.spacing.xxs),
                                            child: DSButtonWidget(
                                                text: LoginBiometryStrings
                                                    .buttonDefaultLogin,
                                                onPressed: () => {
                                                  CommonNavigator.pushReplacementNamed(
                                                      context,
                                                      CommonRoutes.loginDefaultRoute
                                                  )},
                                                type: DSButtonType.outlinedDark
                                            ))),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: _token.spacing.xxs)),
                                  ]),
                            ),
                          ])));
            })));
  }
}
