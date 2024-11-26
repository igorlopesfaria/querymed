import 'dart:ui';

import 'package:design_system_components/progress/bar/progress_bar.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';

class DSProgressBarStyle {
  DSProgressBarStyle();
  double getRadius() => token.radius.sm;
  final int animationTime = 500;
  final token = DSTokenProvider().provide();
  Color getBackgroundColor(DSProgressBarBackgroundType type) => (type == DSProgressBarBackgroundType.light) ? token.color.stateLayersLightMedium: token.color.primary;
  Color getIndicatorColor(DSProgressBarIndicatorType indicatorType) => (indicatorType == DSProgressBarIndicatorType.secondary) ?  token.color.primary: token.color.inversePrimary;
}
