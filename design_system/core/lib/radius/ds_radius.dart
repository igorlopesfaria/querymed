
import 'package:design_system_core/radius/radius_base.dart';

class DSRadius implements RadiusBase {
  DSRadius({
    double? none,
    double? sm,
    double? md,
    double? lg,
    double? xlg,
    double? xxlg,
  }) {
    none = none ?? this.none;
    sm = sm ?? this.sm;
    md = md ?? this.md;
    lg = lg ?? this.lg;
    xlg = xlg ?? this.xlg;
    xxlg = xxlg ?? this.xxlg;
  }

  @override
  double none = 0;

  @override
  double sm = 4;

  @override
  double md = 8;

  @override
  double lg = 12;

  @override
  double xlg = 28;

  @override
  double xxlg = 100;
}
