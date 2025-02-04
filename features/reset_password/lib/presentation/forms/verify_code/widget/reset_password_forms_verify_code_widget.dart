import 'package:commons_media_validation/domain/model/media_validation.dart';
import 'package:commons_navigation/navigator/common_navigator.dart';
import 'package:commons_navigation/route/common_routes.dart';
import 'package:design_system_components/button/button.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.dart';
import 'package:design_system_components/text/text.dart';
import 'package:design_system_components/textfield/code/textfield_code.widget.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:features_reset_password/presentation/forms/verify_code/bloc/reset_password_forms_verify_code_cubit.dart';
import 'package:features_reset_password/presentation/forms/verify_code/bloc/reset_password_forms_verify_code_state.dart';
import 'package:features_reset_password/presentation/forms/verify_code/string/reset_password_verify_code_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ResetPasswordFormsVerifyCodeWidget extends StatefulWidget {
  const ResetPasswordFormsVerifyCodeWidget({
    super.key,
    required this.parentContext,
    required this.showBottomSheetError,
    required this.mediaValidation
  });
  final void Function(DSFeedbackBottomSheetProps) showBottomSheetError;
  final BuildContext parentContext;
  final MediaValidation mediaValidation;

  @override
  State<ResetPasswordFormsVerifyCodeWidget> createState() => _ResetPasswordFormsVerifyCodeWidget();
}

class _ResetPasswordFormsVerifyCodeWidget extends State<ResetPasswordFormsVerifyCodeWidget> {
  final _token = DSTokenProvider().provide();
  final _cubit = GetIt.I.get<ResetPasswordFormsVerifyCodeCubit>();

  @override
  Widget build(BuildContext context) {
    return PopScope(child: Scaffold(
      backgroundColor: _token.color.surface,
      body: BlocProvider.value(
        value: _cubit,
        child: BlocConsumer<ResetPasswordFormsVerifyCodeCubit, ResetPasswordFormsVerifyCodeState>(
          listener: (BuildContext context, state) {
            if(state is ResetPasswordFormsVerifyCodeSuccessState){
              CommonNavigator.pushNamed(
                  widget.parentContext,
                  CommonRoutes.resetPasswordChangePasswordRoute
              );
            }
            else if(state is ResetPasswordFormsVerifyCodeBannerErrorState){
              widget.showBottomSheetError(state.bottomSheetProps);
            }
          },
          builder: (context, state) {
            return SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Column(mainAxisSize: MainAxisSize.max, 
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: _token.spacing.xs,
                                left: _token.spacing.xs,
                                right: _token.spacing.xs
                            ),
                            child: DSTextWidget(
                                text: ResetPasswordVerifyCodeStrings.title,
                                typographyColor: _token.color.onSurfaceHigh,
                                typographyStyle: DSTypographyStyleType.t20Medium
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: _token.spacing.xxxs,
                                left: _token.spacing.xs,
                                right: _token.spacing.xs
                            ),
                            child: DSTextWidget(
                                textAlign: TextAlign.start,
                                text: ResetPasswordVerifyCodeStrings.description.replaceAll("%s", widget.mediaValidation.resource),
                                typographyColor: _token.color.onSurfaceHigh,
                                typographyStyle: DSTypographyStyleType.t14Regular
                            ),
                          ),
                        Padding(
                            padding: EdgeInsets.only(top: _token.spacing.xs),
                            child: DSOneDigitTextFields(
                            onTextChanged: (String text) {
                              _cubit.codeControllerText.text = text;
                              _cubit.checkFormatCode();
                            },
                          )),
                         Visibility(visible: (state is ResetPasswordFormsVerifyCodeFieldErrorState && state.showText),
                             child: Padding(
                              padding: EdgeInsets.only(
                              top: _token.spacing.xxs,
                              left: _token.spacing.xs,
                              right: _token.spacing.xs
                              ),
                              child: DSTextWidget(
                                 text: ResetPasswordVerifyCodeStrings.errorField,
                                 typographyColor: _token.color.danger,
                                 typographyStyle: DSTypographyStyleType.t12Regular
                             ))
                         ),
                        ])
                      )
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
                                        text: ResetPasswordVerifyCodeStrings.next,
                                        showLoading: state is ResetPasswordFormsVerifyCodeLoadingState,
                                        onPressed: () {
                                          _cubit.validateCode(widget.mediaValidation.token);
                                        },
                                        state: (state is ResetPasswordFormsVerifyCodeInitState || state is ResetPasswordFormsVerifyCodeFieldErrorState)? DSButtonState.disabled : DSButtonState.enabled,
                                        type: DSButtonType.primary))),
                          ]),
                    ),
                  ]),
            );
          },
        ),
      ),
    ));
  }
}
