import 'dart:io';

import 'package:commons_core/arguments/arguments.dart';
import 'package:commons_media_validation/domain/model/media_validation.dart';
import 'package:commons_navigation/navigator/common_navigator.dart';
import 'package:commons_navigation/route/common_routes.dart';
import 'package:design_system_components/appbar/appbar.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.props.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:features_reset_password/presentation/forms/username/widget/reset_password_forms_username_widget.dart';
import 'package:features_reset_password/presentation/forms/verify_code/widget/reset_password_forms_verify_code_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPasswordFormsWidget extends StatefulWidget {
  const ResetPasswordFormsWidget({
    super.key,
    required this.clickHelpIcon,
    required this.showBannerError
  });

  final void Function(BuildContext) clickHelpIcon;
  final void Function(BuildContext, DSFeedbackBottomSheetProps) showBannerError;

  @override
  State createState() => _ResetPasswordFormsWidget();
}

class _ResetPasswordFormsWidget extends State<ResetPasswordFormsWidget> {

  final token = DSTokenProvider().provide();
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  double currentPage = 1;
  void setCurrentPageProgress(double page) {
    setState(() {
      currentPage = page;
    });
  }
  FocusNode inputNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DSAppBarWidget(
          iconLeading: Icons.arrow_back,
          onPressedIconLeading: () => {
            (currentPage ==1) ? {
              CommonNavigator.maybePop(context)
            } : {
              setCurrentPageProgress(currentPage - 1),
              _navigatorKey.currentState?.maybePop()
            }
          },
          max: 3,
          current: currentPage,
          menuItem: Icons.support_agent,
          onPressedMenuItem: () => {
            widget.clickHelpIcon(context)
          },
        ),
        backgroundColor: token.color.surface,
        body: SafeArea(
            child: PopScope(
                canPop: true,
                child: Column(children: [
                  Expanded(
                      child: Navigator(
                          key: _navigatorKey,
                          initialRoute: CommonRoutes.resetPasswordUsernameRoute,
                          onGenerateRoute: (settings) {
                            switch (settings.name) {
                              case CommonRoutes.resetPasswordUsernameRoute:
                                return _getPageRoute(
                                    view: ResetPasswordFormsUsernameWidget(
                                        parentContext: context,
                                        showBottomSheetError: (DSFeedbackBottomSheetProps props) {
                                          widget.showBannerError(context, props);
                                        },
                                    ),
                                    settings: const RouteSettings()
                                );
                              case CommonRoutes.resetPasswordVerifyCodeRoute:
                                setCurrentPageProgress(currentPage + 1);
                                return _getPageRoute(
                                    view: ResetPasswordFormsVerifyCodeWidget(
                                      parentContext: context,
                                      showBottomSheetError: (DSFeedbackBottomSheetProps props) {
                                        widget.showBannerError(context, props);
                                      },
                                      mediaValidation: (settings.arguments as Arguments).value as MediaValidation,
                                    ),
                                    settings: const RouteSettings()
                                );
                              default:
                                return _getPageRoute(
                                    view: Scaffold(body: Center(child: Text('No route defined for ${settings.name}'),),),
                                    settings: settings
                                );
                            }
                      })
              )
            ])
          ))
    );
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
}
