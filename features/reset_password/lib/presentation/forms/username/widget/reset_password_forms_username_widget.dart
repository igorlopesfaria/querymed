import 'package:commons_core/arguments/arguments.dart';
import 'package:commons_navigation/navigator/common_navigator.dart';
import 'package:commons_navigation/route/common_routes.dart';
import 'package:design_system_components/button/button.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.dart';
import 'package:design_system_components/select_list/select_list.dart';
import 'package:design_system_components/text/text.dart';
import 'package:design_system_components/textfield/textfield.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:features_address/domain/model/address_state.dart';
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
  final _token = DSTokenProvider().provide();
  final ResetPasswordFormsUsernameCubit _cubit = GetIt.I.get<ResetPasswordFormsUsernameCubit>();

  void _selectAddressState(AddressState newValue) {
    setState(() {
      _cubit.addressStateSelected = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(child: Scaffold(
      backgroundColor: _token.color.surface,
      body: BlocProvider.value(
        value: _cubit,
        child: BlocConsumer<ResetPasswordFormsUsernameCubit, ResetPasswordFormsUsernameState>(
          listener: (BuildContext context, state) {
            switch (state) {
              case ResetPasswordFormsUsernameSuccessState() : {
                CommonNavigator.pushNamed(
                    context,
                    CommonRoutes.resetPasswordVerifyCodeRoute,
                    arguments: Arguments(
                        key: 'mediaValidator',
                        value: state.mediaValidation
                    )
                );
              } 
              case ResetPasswordFormsUsernameBannerErrorState() : {
                state.bottomSheetProps.onButtonPressed = () {
                  _cubit.checkCrmFormat();
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
                                        top: _token.spacing.xs,
                                        left: _token.spacing.xs,
                                        right: _token.spacing.xs
                                    ),
                                    child: DSTextWidget(
                                        text: ResetPasswordFormsUsernameStrings.title,
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
                                        text: ResetPasswordFormsUsernameStrings.description,
                                        typographyColor: _token.color.onSurfaceHigh,
                                        typographyStyle: DSTypographyStyleType.t14Regular
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only( left: _token.spacing.xs,
                                      right: _token.spacing.xs,
                                      top: _token.spacing.xs),
                                    child:
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: DSTextFieldWidget(
                                          autofocus: true,
                                          controller: _cubit.crmNumberControllerText,
                                          keyboardType: TextInputType.number,
                                          typeMask: DSTextFieldMaskType.empty,
                                          onTextChanged: (text) {
                                            _cubit.checkCrmFormat();
                                          },
                                          maxLength: 6,
                                          hintText: ResetPasswordFormsUsernameStrings.crmNumber,
                                          textInputAction: TextInputAction.send,
                                          onSubmitted: (_) {
                                            _cubit.getToken();
                                          },
                                        ),
                                      ),
                                      SizedBox(width: _token.spacing.xxxs),
                                      Expanded(
                                        flex: 1,
                                        child: DSSelectListWidget(
                                          hint: ResetPasswordFormsUsernameStrings.crmState,
                                          text: _cubit.addressStateSelected?.stateCode,
                                          imagePathLeft: _cubit.addressStateSelected?.flagImagePath,
                                          onPressed: () async {
                                            final result = await CommonNavigator.pushNamed(
                                              widget.parentContext,
                                              CommonRoutes.addressStateRoute,
                                              arguments: _cubit.addressStateSelected
                                            );
                                            if (result is AddressState) {
                                              _selectAddressState(result);
                                            }
                                            _cubit.checkCrmFormat();
                                          },
                                        ),
                                      ),
                                    ],
                                  )),
                                ])
                        )
                    ),
                    Expanded(
                      flex: 0,
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child:
                        SizedBox(
                            width: double.infinity,
                            child: Padding(
                                padding: EdgeInsets.all(_token.spacing.xs),
                                child: DSButtonWidget(
                                    state: (state is! ResetPasswordFormsUsernameInitState && state is! ResetPasswordFormsUsernameFieldErrorState) ? DSButtonState.enabled : DSButtonState.disabled,
                                    text: ResetPasswordFormsUsernameStrings.next,
                                    showLoading: state is ResetPasswordFormsUsernameLoadingState,
                                    onPressed: () {
                                      _cubit.getToken();
                                    },
                                    type: DSButtonType.primary))),
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
