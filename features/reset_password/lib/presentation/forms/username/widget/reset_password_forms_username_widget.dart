import 'package:commons_core/arguments/arguments.dart';
import 'package:commons_navigation/navigator/common_navigator.dart';
import 'package:commons_navigation/route/common_routes.dart';
import 'package:design_system_components/button/button.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.dart';
import 'package:design_system_components/text/text.dart';
import 'package:design_system_components/textfield/textfield.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:features_reset_password/presentation/forms/username/bloc/reset_password_forms_username_cubit.dart';
import 'package:features_reset_password/presentation/forms/username/bloc/reset_password_forms_username_state.dart';
import 'package:features_reset_password/presentation/forms/username/string/reset_password_forms_username_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ResetPasswordFormsUsernameWidget extends StatefulWidget {
  const ResetPasswordFormsUsernameWidget({
    super.key,
    required this.parentContext,
    required this.showBottomSheetError
  });
  final void Function(DSFeedbackBottomSheetProps) showBottomSheetError;
  final BuildContext parentContext;


  @override
  State<ResetPasswordFormsUsernameWidget> createState() => _ResetPasswordFormsUsernameWidget();
}

class _ResetPasswordFormsUsernameWidget extends State<ResetPasswordFormsUsernameWidget> {
  final token = DSTokenProvider().provide();
  final ResetPasswordFormsUsernameCubit cubit = GetIt.I.get<ResetPasswordFormsUsernameCubit>();


  @override
  Widget build(BuildContext context) {
    return PopScope(child: Scaffold(
      backgroundColor: token.color.surface,
      body: BlocProvider.value(
        value: cubit,
        child: BlocConsumer<ResetPasswordFormsUsernameCubit, ResetPasswordFormsUsernameState>(
          listener: (BuildContext context, state) {
            switch (state) {
              case ResetPasswordFormsUsernameSuccessState() : {
                CommonNavigator.pushNamed(
                    context,
                    CommonRoutes.resetPasswordVerifyCodeRoute,
                    arguments: Arguments(
                        'mediaValidator', state.mediaValidation
                    )
                );
              } 
              case ResetPasswordFormsUsernameBannerErrorState() : {
                state.bottomSheetProps.onButtonPressed = () {
                  cubit.checkCrmFormat();
                };
                widget.showBottomSheetError(state.bottomSheetProps);
              }
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
                                        left: token.spacing.sm,
                                        right: token.spacing.sm,
                                        top: token.spacing.xs
                                    ),
                                    child: DSTextWidget(
                                        text: ResetPasswordFormsUsernameStrings.title,
                                        typographyColor: token.color.onSurfaceHigh,
                                        typographyStyle: DSTypographyStyleType.t20Medium
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: token.spacing.sm,
                                        right: token.spacing.sm,
                                        top: token.spacing.xxs
                                    ),
                                    child: DSTextWidget(
                                        textAlign: TextAlign.start,
                                        text: ResetPasswordFormsUsernameStrings.description,
                                        typographyColor: token.color.onSurfaceMedium,
                                        typographyStyle: DSTypographyStyleType.t14Regular
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: token.spacing.sm,
                                        right: token.spacing.sm,
                                        top: token.spacing.xs
                                    ),
                                    child: DSTextFiledWidget(
                                        autofocus: true,
                                        controller: cubit.crmNumberControllerText,
                                        keyboardType: TextInputType.emailAddress,
                                        typeMask: DSTextFieldMaskType.empty,
                                        onTextChanged: (String text) => {
                                          cubit.checkCrmFormat()
                                        },
                                        messageError:
                                        (state is ResetPasswordFormsUsernameFieldErrorState)
                                            ? state.messageError : null,
                                        textInputAction: TextInputAction.send,
                                        onSubmitted: (value) {
                                          cubit.getToken();
                                        }),
                                  )])
                        )
                    ),
                    Expanded(
                      flex: 0,
                      child: Align(
                        alignment: FractionalOffset.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: token.spacing.sm,
                              right: token.spacing.sm,
                              bottom: token.spacing.xs
                          ),
                          child: DSButtonWidget(
                            state: (state is! ResetPasswordFormsUsernameInitState && state is! ResetPasswordFormsUsernameFieldErrorState) ? DSButtonState.enabled : DSButtonState.disabled,
                            type: DSButtonType.primary,
                            showLoading: state is ResetPasswordFormsUsernameLoadingState,
                            onPressed: () {
                              cubit.getToken();
                            },
                            iconData: Icons.arrow_forward_ios_outlined,
                          ),
                        ),
                      ),
                    ),
                  ]),
            );
          },
        ),
      ),
    ));
  }
}
