import 'package:design_system_components/snackbar/snackbar.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:design_system_core/token/tokens_base.dart';
import 'package:flutter/material.dart';

class DSSnackBarStyle {

  DSSnackBarStyle();

  static TokensBase _token = DSTokenProvider().provide();

  static Color getBackgroundColorByType(DSSnackBarType type) {
    switch (type) {
      case DSSnackBarType.info:
        return _token.color.infoContainer;
      case DSSnackBarType.warning:
        return _token.color.warningContainer;
      case DSSnackBarType.danger:
        return _token.color.onDangerContainer;
      case DSSnackBarType.neutral:
        return _token.color.surfaceInverse;
    }
  }

  static Color getTextColorByType(DSSnackBarType type) {
    switch (type) {
      case DSSnackBarType.info:
        return _token.color.onInfoContainer;
      case DSSnackBarType.warning:
        return _token.color.onWarningContainer;
      case DSSnackBarType.danger:
        return _token.color.dangerContainer;
      case DSSnackBarType.neutral:
        return _token.color.onSurfaceInverse;
    }
  }
}
