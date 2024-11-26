import 'dart:ui';

import 'package:design_system_core/token/ds_tokens_provider.dart';

class DSProgressStepStyle {
  DSProgressStepStyle();

  final _token = DSTokenProvider().provide();

  Color getInactiveStepColor() => _token.color.primaryContainer;
  Color getActiveStepColor() => _token.color.primary;
  double getInactiveStepHeight() => 2;
  double getActiveStepHeight() => 4;
  double getStepWidth() => 50;
  double getStepSpaceBetween() => _token.spacing.xxs;
}