import 'package:design_system_components/button/button.props.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:flutter/material.dart';

class DSButtonStyle {
  DSButtonStyle();

  final token = DSTokenProvider().provide();

  final strokeProgressCircular = 2.0;
  late final borderRadius = token.radius.md;
  late final backgroundColorDisabled = token.color.stateLayersLightLow;
  final height = 48.0;
  final iconSize = 18.0;
  late final borderWidth = 1.0;

  Color getBackgroundColor(DSButtonType type, DSButtonState state) {
    switch (type) {
      case DSButtonType.primary:
        return state == DSButtonState.enabled ? token.color.primary : Colors.transparent.withOpacity(0.1);
      case DSButtonType.secondary:
        return state == DSButtonState.enabled ? token.color.secondary :  Colors.transparent.withOpacity(0.1);
      case DSButtonType.outlinedDark: return token.color.white;
      case DSButtonType.outlinedLight:
      case DSButtonType.transparent:
        return state == DSButtonState.enabled ? Colors.transparent.withOpacity(0.0) : Colors.transparent.withOpacity(0.09);
    }
  }

  Color getForegroundColor(DSButtonType type) {
    switch (type) {
      case DSButtonType.outlinedDark:
      case DSButtonType.primary:
        return token.color.primaryContainer;
      case DSButtonType.secondary:
        return token.color.secondaryContainer;
      case DSButtonType.outlinedLight:
        return token.color.onPrimaryContainer;
      case DSButtonType.transparent:
        return token.color.onPrimaryContainer;
    }
  }

  Color getContentColorByType(DSButtonType type, DSButtonState state) {
    if(state == DSButtonState.disabled) {
      return token.color.onSurfaceMedium;
    }
    switch (type) {
      case DSButtonType.primary:
        return token.color.onPrimary;
      case DSButtonType.secondary:
        return token.color.onSecondary;
      case DSButtonType.outlinedLight:
        return token.color.onPrimary;
      case DSButtonType.outlinedDark:
      case DSButtonType.transparent:
        return token.color.primary;
    }
  }

  double getHorizontalPadding(DSButtonType type) {
    if (type == DSButtonType.transparent) {
      return 0;
    } else {
      return token.spacing.sm;
    }
  }

  TextStyle getCorrectText(DSButtonType type, DSButtonState state) {
    final commonTextStyle = TextStyle(
      fontFamily: token.font.family.poppins,
      fontSize: token.font.size.t14,
      letterSpacing: -0.6,
      fontWeight: token.font.weight.medium,
    );

    if (state == DSButtonState.enabled) {
      switch (type) {
        case DSButtonType.outlinedLight:
        case DSButtonType.primary:
          return commonTextStyle.copyWith(color: token.color.onPrimary);
        case DSButtonType.secondary:
          return commonTextStyle.copyWith(color: token.color.onSecondary);
        case DSButtonType.outlinedDark: return commonTextStyle.copyWith(
          color: token.color.primary);
        case DSButtonType.transparent:
          return commonTextStyle.copyWith(
            color: token.color.primary,
            decoration: TextDecoration.underline,
            decorationColor: token.color.primary,
            decorationThickness: 1.5, // Adjust the thickness of the underline
            height: 1.5, // Adjust the line height to create space// Adds underline
          );
        default:
          break;
      }
    }

    return commonTextStyle.copyWith(color: token.color.surfaceOutlineHigh);
  }

  Color getBorderColor(DSButtonType type) {
    switch (type) {
      case DSButtonType.outlinedLight:
        return token.color.onPrimary;
      case DSButtonType.outlinedDark:
        return token.color.primary;
      default:
        return token.color.primary;
    }
  }
}