import 'package:flutter/material.dart';

class DSButtonProps {

  DSButtonProps({
    this.text,
    required this.showLoading,
    required this.type,
    required this.state,
    this.onPressed,
    this.iconData
  });

  final String? text;
  final bool showLoading;
  final DSButtonType type;
  final DSButtonState state;
  final void Function()? onPressed;
  final IconData? iconData;
}

enum DSButtonState {
  enabled,
  disabled;
}

enum DSButtonType {
  primary,
  secondary,
  outlinedLight,
  outlinedDark,
  transparent;
}
