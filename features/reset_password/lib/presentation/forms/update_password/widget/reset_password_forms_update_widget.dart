import 'package:commons_media_validation/domain/model/media_validation.dart';
import 'package:commons_navigation/navigator/common_navigator.dart';
import 'package:commons_navigation/route/common_routes.dart';
import 'package:design_system_components/button/button.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.dart';
import 'package:design_system_components/progress/screen/progress_screen.dart';
import 'package:design_system_components/text/text.dart';
import 'package:design_system_components/textfield/textfield.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:features_reset_password/presentation/forms/update_password/bloc/reset_password_forms_update_cubit.dart';
import 'package:features_reset_password/presentation/forms/update_password/string/reset_password_forms_update_string.dart';
import 'package:features_reset_password/presentation/forms/verify_code/string/reset_password_verify_code_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ResetPasswordFormsUpdateWidget extends StatefulWidget {
  const ResetPasswordFormsUpdateWidget({
    super.key,
    required this.parentContext,
    required this.showBottomSheetError,
    required this.mediaValidation
  });
  
  final void Function(DSFeedbackBottomSheetProps) showBottomSheetError;
  final BuildContext parentContext;
  final MediaValidation mediaValidation;
  
  @override
  State<ResetPasswordFormsUpdateWidget> createState() => _ResetPasswordFormsUpdateWidgetState();
}

class _ResetPasswordFormsUpdateWidgetState extends State<ResetPasswordFormsUpdateWidget> {
  final _token = DSTokenProvider().provide();
  final _cubit = GetIt.I.get<ResetPasswordFormsUpdateCubit>();
  late DSProgressScreenCallback _callbackReturn;

  @override
  Widget build(BuildContext context) {
    return PopScope(child: Scaffold(
      backgroundColor: _token.color.surface,
      body: BlocProvider.value(
        value: _cubit,
        child: BlocConsumer<ResetPasswordFormsUpdateCubit, ResetPasswordFormsUpdateState>(
          listener: (BuildContext context, state) {
            if(state is ResetPasswordUpdateSuccessState){
              _callbackReturn.finishProgress();
            }
            else if(state is ResetPasswordFormsUpdateBannerErrorState){
              _callbackReturn.stopProgress();
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
                                        text: ResetPasswordUpdateStrings.title,
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
                                        text: ResetPasswordUpdateStrings.description.replaceAll("%s", widget.mediaValidation.resource),
                                        typographyColor: _token.color.onSurfaceHigh,
                                        typographyStyle: DSTypographyStyleType.t14Regular
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(top: _token.spacing.xs, left: _token.spacing.xs, right: _token.spacing.xs),
                                      child: DSTextFieldWidget(
                                        controller: _cubit.passwordControllerText,
                                        hintText: ResetPasswordUpdateStrings.newPassword,
                                        isPassword: true,
                                        messageError:
                                        (state is ResetPasswordFormsUpdateFieldErrorState)
                                            ? ResetPasswordUpdateStrings.errorField
                                            : null,
                                        textInputAction: TextInputAction.send,
                                      ),
                                  ),
                                  Visibility(visible: (state is ResetPasswordFormsUpdateFieldErrorState && state.showText),
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              top: _token.spacing.xxs,
                                              left: _token.spacing.xs,
                                              right: _token.spacing.xs
                                          ),
                                          child: DSTextWidget(
                                              text: ResetPasswordUpdateStrings.errorField,
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
                                        text: ResetPasswordUpdateStrings.next,
                                        showLoading: state is ResetPasswordFormsUpdateLoadingState,
                                        onPressed: () {
                                          CommonNavigator.push(context,
                                              DSProgressScreenWidget(
                                                text: ResetPasswordUpdateStrings.updating,
                                                callbackInitProgress: (DSProgressScreenCallback callback) {
                                                  _cubit.updatePassword(widget.mediaValidation.token);
                                                  _callbackReturn = callback;
                                                },
                                                callbackFinishProgress: () {
                                                  CommonNavigator.pushNamed(
                                                      widget.parentContext,
                                                      CommonRoutes.loginDefaultRoute
                                                  );
                                                },
                                                callbackStopProgress: () {
                                                  CommonNavigator.pop(context);
                                                },
                                              ));

                                        },
                                        state: (state is ResetPasswordFormsUpdateInitState || state is ResetPasswordFormsUpdateFieldErrorState)? DSButtonState.disabled : DSButtonState.enabled,
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