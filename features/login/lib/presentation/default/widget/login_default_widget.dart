import 'package:commons_navigation/navigator/common_navigator.dart';
import 'package:commons_navigation/route/common_routes.dart';
import 'package:design_system_components/appbar/appbar.dart';
import 'package:design_system_components/button/button.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.dart';
import 'package:design_system_components/text/text.dart';
import 'package:design_system_components/textfield/textfield.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:features_login/presentation/default/bloc/login_default_cubit.dart';
import 'package:features_login/presentation/default/bloc/login_default_state.dart';
import 'package:features_login/presentation/default/string/login_default_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LoginDefaultWidget extends StatefulWidget {
  @override
  State createState() => _LoginDefaultWidget();

  const LoginDefaultWidget({
    super.key,
    this.email,
    required this.showBannerError,
    required this.clickHelpIcon
  });

  final String? email;
  final void Function(BuildContext, DSFeedbackBottomSheetProps) showBannerError;
  final void Function(BuildContext) clickHelpIcon;
}

class _LoginDefaultWidget extends State<LoginDefaultWidget> {
  final LoginDefaultCubit _cubit = GetIt.I.get<LoginDefaultCubit>();

  final _token = DSTokenProvider().provide();

  @override
  void initState() {
    super.initState();
    if (widget.email != null) {
      String maskedCpf = "***${widget.email!.substring(3, 12)}**";
      _cubit.controllerTextEmail.text = maskedCpf;
    } else {
      _cubit.controllerTextEmail.text = widget.email ?? "";
    }
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
            child: BlocConsumer<LoginDefaultCubit, LoginDefaultState>(
                listener: (BuildContext context, state) {
              FocusManager.instance.primaryFocus?.unfocus();
              // if (state is LoginDefaultSuccessState &&
              //     state.shouldShowBiometryPermission) {
              //   DSAppNavigator.pushReplacementNamed(
              //       context, DSRoutes.biometryRegisterRoute,
              //       arguments: state.flowStep);
              // } else if (state is LoginDefaultSuccessState &&
              //     !state.shouldShowBiometryPermission) {
              //   DSAppNavigator.pushReplacementNamed(
              //       context, state.flowStep.workflow.current.name,
              //       arguments: state.flowStep.name);
              // } else if (state is LoginDefaultBannerErrorState) {
              //   showBannerError(context, state.title, state.description,
              //       state.textButton, state.type);
              // } else if (state is LoginDefaultSnackErrorState) {
              //   DSSnackBarWidget.show(
              //       context, state.message, DSSnackBarType.neutral);
              // } else if (state is LoginDefaultRedirectForgotPasswordState) {
              //   showForgotPasswordBottomSheet(
              //     context,
              //   );
              // }
              // // after all navigation if has deeplink open at first in stack
              // if (state is LoginDefaultSuccessState &&
              //     DSNavigatorDeeplinkProvider().provide() != null) {
              //   Navigator.pushNamed(
              //       context, DSNavigatorDeeplinkProvider().provide()!,
              //       arguments: state.flowStep.name);
              //   DSNavigatorDeeplinkProvider().clearDeeplinkCache();
              // }
            }, builder: (context, state) {
              return SafeArea(child: SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Column(mainAxisSize: MainAxisSize.max, children: [
                    Expanded(
                        child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: _token.spacing.xs,
                                      bottom: _token.spacing.xxs,
                                    ),
                                    child: SizedBox(
                                      width: _token.spacing.xxl,
                                      height: _token.spacing.xxl,
                                      child: Image(
                                        image: AssetImage(
                                          _token.assets.imLogo
                                        ),
                                        key: widget.key,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: _token.spacing.xs,
                                        right: _token.spacing.xs),
                                    child: DSTextWidget(
                                        text: LoginDefaultStrings.title,
                                        textAlign: TextAlign.left,
                                        typographyColor: _token.color.onSurfaceHigh,
                                        typographyStyle: DSTypographyStyleType.t20Medium),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: _token.spacing.xxxs,
                                        left: _token.spacing.xs,
                                        right: _token.spacing.xs),
                                    child: DSTextWidget(
                                        text: LoginDefaultStrings.description,
                                        textAlign: TextAlign.left,
                                        typographyColor: _token.color.onSurfaceHigh,
                                        typographyStyle: DSTypographyStyleType.t14Regular),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: _token.spacing.xs,
                                        right: _token.spacing.xs,
                                        top: _token.spacing.xs),
                                    child: DSTextFieldWidget(
                                      controller: _cubit.controllerTextEmail,
                                      hintText: LoginDefaultStrings.email,
                                      keyboardType: TextInputType.emailAddress,
                                      messageError:
                                          (state is LoginDefaultFieldErrorState)
                                              ? state.messageErrorEmail
                                              : null,
                                      enable: widget.email?.isEmpty == true,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: _token.spacing.xs,
                                        right: _token.spacing.xs,
                                        top: _token.spacing.xs),
                                    child: DSTextFieldWidget(
                                      controller: _cubit.controllerTextPassword,
                                      hintText: LoginDefaultStrings.password,
                                      isPassword: true,
                                      messageError:
                                          (state is LoginDefaultFieldErrorState)
                                              ? state.messageErrorPassword
                                              : null,
                                          textInputAction: TextInputAction.send,
                                        ),
                                      ),
                                   Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: _token.spacing.xxs,
                                            horizontal: _token.spacing.xs),
                                        child: DSButtonWidget(
                                            text: LoginDefaultStrings.forgotPassword,
                                            onPressed: () {
                                              CommonNavigator.pushNamed(
                                                  context,
                                                  CommonRoutes.resetPasswordRoute
                                              );
                                            },
                                            type: DSButtonType.transparent)),
                        ]))
                    ),
                    Expanded(
                      flex: 0,
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                                width: double.infinity,
                                child: Padding(
                                    padding: EdgeInsets.all(_token.spacing.xs),
                                    child: DSButtonWidget(
                                        text: LoginDefaultStrings.enter,
                                        showLoading: state is LoginDefaultLoadingState,
                                        onPressed: () {
                                          CommonNavigator.pushNamed(
                                              context,
                                              CommonRoutes.biometryRegisterRoute
                                          );
                                          // _cubit.authentication();
                                        },
                                        type: DSButtonType.primary))),
                          ]),
                    ),
                  ])));
            })));
  }

  // void showForgotPasswordBottomSheet(BuildContext context) {
  //   showDSBottomSheet(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return ResetPasswordPasswordWidget(
  //           crm: cubit.crm,
  //         );
  //       });
  // }


}
