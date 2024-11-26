import 'package:design_system_core/loading/loading_base.dart';

class DSLoading implements LoadingBase {
  @override
  LoadingSizeBase size = DSLoadingSize();

  @override
  LoadingStrokeBase stroke = DSLoadingStroke();
}

class DSLoadingStroke implements LoadingStrokeBase {
  DSLoadingStroke({
    double? sm,
    double? md,
    double? lg,
    double? xl,
  }) {
    sm = sm ?? this.sm;
    md = md ?? this.md;
    lg = lg ?? this.lg;
    xl = xl ?? this.xl;
  }

  @override
  double sm = 1;

  @override
  double md = 2;

  @override
  double lg = 3;

  @override
  double xl = 4;
}

class DSLoadingSize implements LoadingSizeBase {
  DSLoadingSize({
    double? sm,
    double? md,
    double? lg,
    double? xl,
  }) {
    sm = sm ?? this.sm;
    md = md ?? this.md;
    lg = lg ?? this.lg;
    xl = xl ?? this.xl;
  }

  @override
  double sm = 4;

  @override
  double md = 8;

  @override
  double lg = 14;

  @override
  double xl = 36;
}
