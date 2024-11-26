import 'package:design_system_core/checkbox/checkbox_base.dart';

class DSCheckbox implements CheckboxBase {
  @override
  CheckboxSizeBase size = DSCheckboxSize();
  @override
  CheckboxBorderBase border = DSCheckboxBorderSize();
}

class DSCheckboxSize implements CheckboxSizeBase {
  DSCheckboxSize({double? sm, double? md, double? lg}) {
    this.sm = sm ?? this.sm;
    this.md = md ?? this.md;
    this.lg = lg ?? this.lg;
  }

  @override
  double sm = 20;

  @override
  double md = 24;

  @override
  double lg = 28;
}

class DSCheckboxBorderSize implements CheckboxBorderBase {
  DSCheckboxBorderSize({double? sm, double? md, double? lg}) {
    this.sm = sm ?? this.sm;
    this.md = md ?? this.md;
    this.lg = lg ?? this.lg;
  }

  @override
  double sm = 6;

  @override
  double md = 8;

  @override
  double lg = 10;
}
