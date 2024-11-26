import 'package:design_system_components/button/button.props.dart';
import 'package:design_system_components/button/button.style.dart';
import 'package:design_system_components/progress/circular/progress_circular.dart';
import 'package:flutter/material.dart';

class DSButtonTextWidget extends StatelessWidget {
  DSButtonTextWidget({
    super.key,
    required void Function()? onPressed,
    String? text,
    bool showLoading = false,
    DSButtonState state = DSButtonState.enabled,
    DSButtonType type = DSButtonType.primary,
    IconData? iconData
  }) : props = DSButtonProps(
      text: text,
      type: type,
      showLoading: showLoading,
      state: state,
      onPressed: onPressed,
      iconData: iconData
  );

  final DSButtonProps props;
  final buttonStyle = DSButtonStyle();

  @override
  Widget build(BuildContext context) {

    return TextButton(
        onPressed:
        props.state == DSButtonState.disabled ? null : props.onPressed ,
        style: TextButton.styleFrom(
            foregroundColor: buttonStyle.getForegroundColor(props.type),
            padding: EdgeInsets.only(left: buttonStyle.getHorizontalPadding(props.type), right:  buttonStyle.getHorizontalPadding(props.type), top: 12, bottom: 14),
            fixedSize: Size.fromHeight(buttonStyle.height),
            shape: (props.iconData != null ) ?
              const CircleBorder():
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonStyle.borderRadius),
              ),
            backgroundColor:  buttonStyle.getBackgroundColor(props.type, props.state),
            disabledForegroundColor: buttonStyle.token.color.stateLayersLightLow),
        child: Stack(alignment: Alignment.center, children: [
          Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: props.showLoading,
            child: DSProgressCircularWidget(
              strokeWidth: buttonStyle.strokeProgressCircular,
              color: buttonStyle.getContentColorByType(props.type, props.state),
              size: buttonStyle.token.loading.size.lg,
            ),
          ),
          Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: !props.showLoading,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                if (props.iconData != null)
                  Icon(
                      props.iconData,
                      color: buttonStyle.getContentColorByType(props.type, props.state),
                      size: 18.0),
                if (props.text != null)
                  Padding(
                      padding: EdgeInsets.only(left: props.iconData != null ?
                        buttonStyle.token.spacing.xxs : 0
                      ),
                      child: Text(
                        props.text!,
                        style: buttonStyle.getCorrectText(props.type, props.state),
                      )
                  )
              ])),
        ]));
  }
}
