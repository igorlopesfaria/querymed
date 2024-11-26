import 'package:design_system_components/button/button.props.dart';
import 'package:design_system_components/button/button.widget.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.dart';
import 'package:design_system_components/text/text.props.dart';
import 'package:design_system_components/text/text.widget.dart';
import 'package:flutter/material.dart';


class DSFeedbackBottomSheetWidget extends StatelessWidget {
  DSFeedbackBottomSheetWidget({
    super.key,
    required String title,
    required String description,
    DSFeedbackBottomSheetType type = DSFeedbackBottomSheetType.fatalError,
    String? buttonText,
    void Function()? onButtonPressed,
  }) : props = DSFeedbackBottomSheetProps(
            title: title,
            description: description,
            type: type,
            buttonText: buttonText,
            onButtonPressed: onButtonPressed);
  final DSFeedbackBottomSheetProps props;

  @override
  Widget build(BuildContext context) {
    final style = DSFeedbackBottomSheetStyle();
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: style.token.spacing.sm),
              child: Image(
                alignment: Alignment.topLeft,
                image: AssetImage(style.getIconByType(props.type)),
              )),
          Padding(
            padding: EdgeInsets.only(
                bottom: style.token.spacing.xxs,
                left: style.token.spacing.sm,
                top: style.token.spacing.xs,
                right: style.token.spacing.sm),
            child: DSTextWidget(
                text: props.title,
                textAlign: TextAlign.start,
                typographyColor: style.token.color.onSurfaceHigh,
                typographyStyle: DSTypographyStyleType.t20SemiBold),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: style.token.spacing.xs,
                left: style.token.spacing.sm,
                top: style.token.spacing.xxxs,
                right: style.token.spacing.sm),
            child: DSTextWidget(
                text: props.description,
                textAlign: TextAlign.start,
                typographyColor: style.token.color.onSurfaceLow,
                typographyStyle: DSTypographyStyleType.t16Regular),
          ),

          SizedBox(
              width: double.infinity,
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: style.token.spacing.xs, horizontal: style.token.spacing.sm),
                  child: DSButtonWidget(
                      text: props.buttonText,
                      onPressed: () => {
                        props.onButtonPressed?.call()
                      },
                      type: DSButtonType.primary))),
        ]);
  }
}
