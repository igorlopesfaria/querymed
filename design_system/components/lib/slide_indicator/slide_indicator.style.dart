import 'dart:ui';

import 'package:design_system_core/token/ds_tokens_provider.dart';

class DSSlideIndicatorStyle {
  DSSlideIndicatorStyle();

  final _token = DSTokenProvider().provide();

  Color getInactiveStepColor() => _token.color.primaryContainer;
  Color getActiveStepColor() => _token.color.secondary;
  double getStepHeight() => 4;
  double getStepWidth() => 40;
  double getStepSpaceBetween() => _token.spacing.xs;
}