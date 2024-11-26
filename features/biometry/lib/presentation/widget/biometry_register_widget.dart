import 'package:commons_core/animation/custom_animation.dart';
import 'package:commons_navigation/navigator/common_navigator.dart';
import 'package:commons_navigation/route/common_routes.dart';
import 'package:design_system_components/appbar/appbar.dart';
import 'package:design_system_components/button/button.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.dart';
import 'package:design_system_components/snackbar/snackbar.dart';
import 'package:design_system_components/text/text.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:features_biometry/presentation/bloc/biometry_register_cubit.dart';
import 'package:features_biometry/presentation/bloc/biometry_register_state.dart';
import 'package:features_biometry/presentation/string/biometry_register_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

class BiometryRegisterWidget extends StatefulWidget {
  @override
  State createState() => _BiometryRegisterWidget();

  const BiometryRegisterWidget(
      {super.key, required this.showBannerError, required this.clickHelpIcon});

  final void Function(BuildContext, DSFeedbackBottomSheetProps) showBannerError;
  final void Function(BuildContext) clickHelpIcon;
}

class _BiometryRegisterWidget extends State<BiometryRegisterWidget>
    with TickerProviderStateMixin {
  final _cubit = GetIt.I.get<BiometryRegisterCubit>();
  final _token = DSTokenProvider().provide();
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _token.color.surface,
        appBar: DSAppBarWidget(
          type: DSAppBarType.light,
          menuItem: Icons.support_agent,
          onPressedMenuItem: () => {widget.clickHelpIcon(context)},
        ),
        body: BlocProvider.value(
            value: _cubit,
            child: BlocConsumer<BiometryRegisterCubit, BiometryRegisterState>(
                listener: (BuildContext context, state) {
              if (state is BiometryRegisterSuccessState) {
                CommonNavigator.pushReplacementNamed(
                    context, CommonRoutes.homeRoute);
              } else if (state is BiometryRegisterSnackErrorState) {
                DSSnackBarWidget.show(
                    context, state.message, DSSnackBarType.danger);
              }
            }, builder: (context, state) {
              return SafeArea(
                  child: SizedBox(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: SingleChildScrollView(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        // Aligns text to the left
                                        children: [
                                  Center(
                                      // Centers the Lottie animation
                                      child: Padding(
                                    padding: EdgeInsets.only(
                                        left: _token.spacing.xs,
                                        bottom: _token.spacing.xs,
                                        right: _token.spacing.xs),
                                    child: SizedBox(
                                      child: Lottie.asset(
                                        _token.assets.animBiometry,
                                        decoder: customDecoder,
                                        controller: _controller,
                                        height: 250,
                                        fit: BoxFit.fill,
                                        onLoaded: (composition) {
                                          _controller
                                            ..duration = composition.duration
                                            ..forward()
                                            ..repeat();
                                        },
                                      ),
                                    ),
                                  )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: _token.spacing.xs,
                                        right: _token.spacing.xs,
                                        bottom: _token.spacing.xxxs),
                                    child: DSTextWidget(
                                        text: BiometryRegisterStrings.title,
                                        textAlign: TextAlign.left,
                                        typographyColor:
                                            _token.color.onSurfaceHigh,
                                        typographyStyle:
                                            DSTypographyStyleType.t20Medium),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: _token.spacing.xs,
                                        right: _token.spacing.xs,
                                        top: _token.spacing.xxxs),
                                    child: DSTextWidget(
                                        text:
                                            BiometryRegisterStrings.description,
                                        textAlign: TextAlign.left,
                                        typographyColor:
                                            _token.color.onSurfaceHigh,
                                        typographyStyle:
                                            DSTypographyStyleType.t14Regular),
                                  ),
                                ]))),
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
                                                top: _token.spacing.xxs),
                                            child: DSButtonWidget(
                                                text: BiometryRegisterStrings
                                                    .useBiometry,
                                                showLoading: state
                                                    is BiometryRegisterLoadingState,
                                                onPressed: () {
                                                  _cubit.authenticateOS();
                                                },
                                                type: DSButtonType.primary))),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: _token.spacing.xxs)),
                                    SizedBox(
                                        width: double.infinity,
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: _token.spacing.xs),
                                            child: DSButtonWidget(
                                                text: BiometryRegisterStrings
                                                    .notNow,
                                                onPressed: () {
                                                  CommonNavigator.pushNamed(
                                                      context,
                                                      CommonRoutes.homeRoute);
                                                },
                                                type: DSButtonType.outlinedDark))),
                                    Padding(padding: EdgeInsets.only(bottom: _token.spacing.xs)),
                                  ]),
                            ),
                          ])));
            })));
  }
}
