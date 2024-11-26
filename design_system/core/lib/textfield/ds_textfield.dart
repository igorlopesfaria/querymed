import 'package:design_system_core/textfield/textfield_base.dart';

class DSTextField implements TextFieldBase {
  @override
  TextFieldHeightBase height = DSTextFieldHeight();
}

class DSTextFieldHeight implements TextFieldHeightBase {
  DSTextFieldHeight({double? sm, double? md, double? lg}) {
    this.sm = sm ?? this.sm;
    this.md = md ?? this.md;
    this.lg = lg ?? this.lg;
  }

  @override
  double sm = 15;

  @override
  double md = 20;

  @override
  double lg = 67;
}
