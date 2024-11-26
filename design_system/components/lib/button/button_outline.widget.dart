import 'package:design_system_components/button/button.props.dart';
import 'package:design_system_components/button/button.style.dart';
import 'package:design_system_components/progress/circular/progress_circular.dart';
import 'package:flutter/material.dart';

class DSButtonOutlinedWidget extends StatelessWidget {
  DSButtonOutlinedWidget({
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

    return OutlinedButton(
        onPressed:
            props.state == DSButtonState.disabled ? null : props.onPressed ,
        style: OutlinedButton.styleFrom(
            foregroundColor: buttonStyle.getForegroundColor(props.type),
            padding: EdgeInsets.only(left: buttonStyle.getHorizontalPadding(props.type), right:  buttonStyle.getHorizontalPadding(props.type), top: 12, bottom: 14),
            fixedSize: Size.fromHeight(buttonStyle.height),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonStyle.borderRadius),
            ),
            side: BorderSide(
              width: buttonStyle.borderWidth,
              color: buttonStyle.getBorderColor(props.type)
            ),
            backgroundColor: props.state == DSButtonState.disabled ?
              buttonStyle.backgroundColorDisabled : buttonStyle.getBackgroundColor(props.type, props.state),
            disabledForegroundColor:
                buttonStyle.token.color.stateLayersLightLow),
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
                if (props.text != null)
                  Text(
                    props.text!,
                    style: buttonStyle.getCorrectText(props.type, props.state),
                  ),
                if (props.iconData != null)
                  Icon(
                    props.iconData,
                    color: buttonStyle.getContentColorByType(props.type, props.state),
                    size: buttonStyle.iconSize)

              ])),
        ]));
  }
}
