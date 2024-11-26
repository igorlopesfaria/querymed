import 'package:design_system_core/divider/divider_base.dart';

class DSDivider implements DividerBase {
  @override
  DividerHeightBase height = DSDividerHeight();
}

class DSDividerHeight implements DividerHeightBase {
  DSDividerHeight({double? sm, double? md, double? lg}) {
    this.sm = sm ?? this.sm;
    this.md = md ?? this.md;
    this.lg = lg ?? this.lg;
  }

  @override
  double sm = 1;

  @override
  double md = 2;

  @override
  double lg = 4;
}
