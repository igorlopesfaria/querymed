
import 'package:design_system_core/assets/assets_base.dart';
import 'package:design_system_core/assets/ds_assets.dart';
import 'package:design_system_core/checkbox/checkbox_base.dart';
import 'package:design_system_core/checkbox/ds_checkbox.dart';
import 'package:design_system_core/color/ds_material_color.dart';
import 'package:design_system_core/color/material_color_base.dart';
import 'package:design_system_core/divider/divider_base.dart';
import 'package:design_system_core/divider/ds_divider.dart';
import 'package:design_system_core/font/ds_font.dart';
import 'package:design_system_core/font/font_base.dart';
import 'package:design_system_core/loading/ds_loading.dart';
import 'package:design_system_core/loading/loading_base.dart';
import 'package:design_system_core/radius/ds_radius.dart';
import 'package:design_system_core/radius/radius_base.dart';
import 'package:design_system_core/spacing/ds_spacing.dart';
import 'package:design_system_core/spacing/spacing_base.dart';
import 'package:design_system_core/text/ds_text.dart';
import 'package:design_system_core/text/text_base.dart';
import 'package:design_system_core/textfield/ds_textfield.dart';
import 'package:design_system_core/textfield/textfield_base.dart';
import 'package:design_system_core/token/tokens_base.dart';

class DSTokens implements TokensBase {
  @override
  SpacingBase spacing = DSSpacing();

  @override
  TextBase text = DSText();

  @override
  RadiusBase radius = DSRadius();

  @override
  DividerBase divider = DSDivider();

  @override
  FontBase font = DSFont();

  @override
  MaterialColorBase color = DSMaterialColor();

  @override
  TextFieldBase textField = DSTextField();

  @override
  LoadingBase loading = DSLoading();

  @override
  AssetsBase assets = DSAssets();

  @override
  CheckboxBase checkbox= DSCheckbox();
}
