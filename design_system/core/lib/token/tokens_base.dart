import 'package:design_system_core/assets/assets_base.dart';
import 'package:design_system_core/checkbox/checkbox_base.dart';
import 'package:design_system_core/color/material_color_base.dart';
import 'package:design_system_core/divider/divider_base.dart';
import 'package:design_system_core/font/font_base.dart';
import 'package:design_system_core/loading/loading_base.dart';
import 'package:design_system_core/radius/radius_base.dart';
import 'package:design_system_core/spacing/spacing_base.dart';
import 'package:design_system_core/text/text_base.dart';
import 'package:design_system_core/textfield/textfield_base.dart';

abstract class TokensBase {
  late SpacingBase spacing;

  late RadiusBase radius;

  late DividerBase divider;

  late FontBase font;

  late TextBase text;

  late MaterialColorBase color;

  late TextFieldBase textField;

  late CheckboxBase checkbox;

  late LoadingBase loading;

  late AssetsBase assets;
}


