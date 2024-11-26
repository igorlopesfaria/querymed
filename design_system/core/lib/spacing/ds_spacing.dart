
import 'package:design_system_core/spacing/spacing_base.dart';

class DSSpacing implements SpacingBase {
  DSSpacing({
    double? xxxs,
    double? xxs,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
    double? xxxl,
  }) {
    xxxs = xxxs ?? this.xxxs;
    xxs = xxs ?? this.xxs;
    xs = xs ?? this.xs;
    sm = sm ?? this.sm;
    md = md ?? this.md;
    lg = lg ?? this.lg;
    xl = xl ?? this.xl;
    xxl = xxl ?? this.xxl;
    xxxl = xxxl ?? this.xxxl;
  }

  @override
  double xxxs = 4;

  @override
  double xxs = 8;

  @override
  double xs = 16;

  @override
  double sm = 24;

  @override
  double md = 32;

  @override
  double lg = 40;

  @override
  double xl = 48;

  @override
  double xxl = 56;

  @override
  double xxxl = 64;
}
