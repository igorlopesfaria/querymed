import 'dart:ui';

import 'package:design_system_components/appbar/appbar.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';

class DSAppBarStyle {

  final token = DSTokenProvider().provide();

  late final double sizeIcon = 24.0;

  Color getBackgroundColor(DSAppBarType type) =>
      type == DSAppBarType.light ? token.color.surface : token.color.primaryDark;

  Color getIconColor(DSAppBarType type) =>
      type == DSAppBarType.light ? token.color.onSurfaceHigh : token.color.onPrimary;

}