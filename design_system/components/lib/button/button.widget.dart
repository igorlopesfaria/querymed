import 'package:design_system_components/button/button.props.dart';
import 'package:design_system_components/button/button_outline.widget.dart';
import 'package:design_system_components/button/button_text.widget.dart';
import 'package:flutter/material.dart';

class DSButtonWidget extends StatelessWidget {

  DSButtonWidget({
    super.key,
    required void Function()? onPressed,
    String? text,
    bool showLoading = false,
    DSButtonState state = DSButtonState.enabled,
    DSButtonType type = DSButtonType.primary,
    IconData? iconData}) : props = DSButtonProps(
      text: text,
      type: type,
      showLoading: showLoading,
      state: state,
      onPressed: onPressed,
      iconData: iconData
  );

  final DSButtonProps props;

  @override
  Widget build(BuildContext context) {

    if (props.type == DSButtonType.outlinedLight || props.type == DSButtonType.outlinedDark) {
      return DSButtonOutlinedWidget(
          text: props.text,
          type: props.type,
          showLoading: props.showLoading,
          state: props.state,
          onPressed: props.onPressed,
          iconData: props.iconData
      );
    } else {
      return DSButtonTextWidget(
          text: props.text,
          type: props.type,
          showLoading: props.showLoading,
          state: props.state,
          onPressed: props.onPressed,
          iconData: props.iconData
      );
    }
  }
}
