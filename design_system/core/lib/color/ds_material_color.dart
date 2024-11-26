import 'dart:ui';

import 'package:design_system_core/color/color_base.dart';
import 'package:design_system_core/color/material_color_base.dart';
import 'package:flutter/material.dart';

class DSMaterialColor implements MaterialColorBase  {

  ColorBase colorBase = DSColor();

  @override
  late Color primary = colorBase.primaryBase.ten;

  @override
  late Color primaryDark = colorBase.primaryBase.zero;

  @override
  late Color primaryContainer = colorBase.primaryBase.eighty;

  @override
  late Color onPrimary = colorBase.primaryBase.hundred;

  @override
  late Color onPrimaryContainer = colorBase.primaryBase.twenty;

  @override
  late Color inversePrimary = colorBase.primaryBase.eighty;


  @override
  late Color secondary =  colorBase.secondaryBase.ten;

  @override
  late Color secondaryDark = colorBase.secondaryBase.zero;

  @override
  late Color secondaryContainer =  colorBase.secondaryBase.eighty;

  @override
  late Color onSecondary =  colorBase.secondaryBase.hundred;

  @override
  late Color onSecondaryContainer =  colorBase.secondaryBase.twenty;

  @override
  late Color inverseSecondary = colorBase.primaryBase.eighty;

  @override
  late Color surface =  colorBase.neutralBase.eighty;

  @override
  late Color surfaceBright =  colorBase.neutralBase.hundred;

  @override
  late Color surfaceInverse =  colorBase.neutralBase.twenty;

  @override
  late Color onSurfaceInverse =  colorBase.neutralBase.eighty;

  @override
  late Color onSurfaceLow =  colorBase.neutralBase.forty;

  @override
  late Color onSurfaceMedium =  colorBase.neutralBase.twenty;

  @override
  late Color onSurfaceHigh =  colorBase.neutralBase.ten;

  @override
  late Color surfaceOutlineLow =  colorBase.neutralBase.eighty;

  @override
  late Color surfaceOutlineMedium =  colorBase.neutralBase.sixty;

  @override
  late Color surfaceContainer =  colorBase.neutralBase.eighty;
  
  @override
  late Color surfaceOutlineHigh =  colorBase.neutralBase.forty;

  @override
  late Color stateLayersLightHigh =  colorBase.stateLayerLight.high;

  @override
  late Color stateLayersLightMedium =  colorBase.stateLayerLight.medium;

  @override
  late Color stateLayersLightLow =  colorBase.stateLayerLight.low;

  @override
  late Color stateLayersDarkHigh =  colorBase.stateLayerDark.high;

  @override
  late Color stateLayersDarkMedium =  colorBase.stateLayerDark.medium;

  @override
  late Color stateLayersDarkLow =  colorBase.stateLayerDark.low;


  @override
  late Color danger = colorBase.dangerBase.ten;

  @override
  late Color dangerContainer = colorBase.dangerBase.eighty;

  @override
  late Color onDangerContainer = colorBase.dangerBase.ten;

  @override
  late Color onDanger = colorBase.dangerBase.ten;

  @override
  late Color warning = colorBase.warningBase.ten;

  @override
  late Color warningContainer = colorBase.warningBase.eighty;

  @override
  late Color onWarningContainer = colorBase.warningBase.zero;

  @override
  late Color onWarning = colorBase.warningBase.ten;

  @override
  late Color info = colorBase.infoBase.ten;

  @override
  late Color infoContainer = colorBase.infoBase.eighty;

  @override
  late Color onInfoContainer = colorBase.infoBase.zero;

  @override
  late Color onInfo = colorBase.infoBase.ten;

  
  @override
  late Color black = colorBase.neutralBase.zero;

  @override
  late Color white = colorBase.neutralBase.hundred;

}

class DSColor implements ColorBase {

  DSColor({
    ColorScaleBase? neutralBase,
    ColorScaleBase? primaryBase,
    ColorScaleBase? secondaryBase,
    ColorScaleBase? dangerBase,
    ColorScaleBase? warningBase,
    ColorScaleBase? infoBase,
    ColorStateLayerBase? stateLayerLight,
    ColorStateLayerBase? stateLayerDark,
    Color? black,
    Color? white
  }){
    this.neutralBase = neutralBase ?? this.neutralBase;
    this.primaryBase = primaryBase ?? this.primaryBase;
    this.secondaryBase = secondaryBase ?? this.secondaryBase;
    this.dangerBase = dangerBase ?? this.dangerBase;
    this.warningBase = warningBase ?? this.warningBase;
    this.infoBase = infoBase ?? this.infoBase;
    this.stateLayerLight = stateLayerLight ?? this.stateLayerLight;
    this.stateLayerDark = stateLayerDark ?? this.stateLayerDark;
    this.black = black ?? this.black;
    this.white = white ?? this.white;
  }

  @override
  ColorScaleBase neutralBase = DSColorNeutral();

  @override
  ColorScaleBase primaryBase = DSColorPrimary();

  @override
  ColorScaleBase secondaryBase = DSColorSecondary();

  @override
  ColorScaleBase dangerBase = DSColorDanger();

  @override
  ColorScaleBase infoBase = DSColorInfo();

  @override
  ColorScaleBase warningBase = DSColorWarning();

  @override
  ColorStateLayerBase stateLayerLight = DSColorStateLayerLight();

  @override
  ColorStateLayerBase stateLayerDark = DSColorStateLayerDark();


  @override
  Color black = const Color(0xFF000000);

  @override
  Color white= const Color(0xFFFFFFFF);

}

class DSColorPrimary implements ColorScaleBase {
 DSColorPrimary({
    Color? zero,
    Color? ten,
    Color? twenty,
    Color? forty,
    Color? sixty,
    Color? eighty,
    Color? hundred
 }) {
    this.zero = zero ?? this.zero;
    this.twenty = twenty ?? this.twenty;
    this.ten = ten ?? this.ten;
    this.forty = forty ?? this.forty;
    this.sixty = sixty ?? this.sixty;
    this.eighty = eighty ?? this.eighty;
    this.hundred = hundred ?? this.hundred;
 }
 @override
 Color zero = const Color(0xFF5E7291); // Dark blue close to `ten`

 @override
 Color ten = const Color(0xFF96A6C9); // Defined muted blue

 @override
 Color twenty = const Color(0xFFA8B5D1); // Slightly lighter than `ten`

 @override
 Color forty = const Color(0xFFB9C6DA); // Softer blue, still rich in

 @override
 Color sixty = const Color(0xFFC8D4E3); // Noticeably lighter, a pastel blue

 @override
 Color eighty = const Color(0xFFD8E1EC); // Very light blue but not near white

 @override
 Color hundred = const Color(0xFFFFFFFF); // Pure white

}

class DSColorSecondary implements ColorScaleBase {
 DSColorSecondary({
  Color? zero,
  Color? ten,
  Color? twenty,
  Color? forty,
  Color? sixty,
  Color? eighty,
  Color? hundred,

 }) {
  this.zero = zero ?? this.zero;
  this.twenty = twenty ?? this.twenty;
  this.ten = ten ?? this.ten;
  this.forty = forty ?? this.forty;
  this.sixty = sixty ?? this.sixty;
  this.eighty = eighty ?? this.eighty;
  this.hundred = hundred ?? this.hundred;
 }

 @override
 Color zero = const Color(0xFFCC6D6B); // Dark muted red-pink, close to `ten`

 @override
 Color ten = const Color(0xFFFFA7A5); // Defined light coral red

 @override
 Color twenty = const Color(0xFFFFB8B6); // Slightly lighter than `ten`

 @override
 Color forty = const Color(0xFFFFCBC9); // Softened pinkish hue

 @override
 Color sixty = const Color(0xFFFFDDDB); // Pastel light pink

 @override
 Color eighty = const Color(0xFFFFEEED); // Very light pink, nearing white

 @override
 Color hundred = const Color(0xFFFFFFFF); // Pure white

}

class DSColorNeutral implements ColorScaleBase {
 DSColorNeutral({
  Color? zero,
  Color? ten,
  Color? twenty,
  Color? forty,
  Color? sixty,
  Color? eighty,
  Color? hundred,

 }) {
  this.zero = zero ?? this.zero;
  this.twenty = twenty ?? this.twenty;
  this.ten = ten ?? this.ten;
  this.forty = forty ?? this.forty;
  this.sixty = sixty ?? this.sixty;
  this.eighty = eighty ?? this.eighty;
  this.hundred = hundred ?? this.hundred;
 }

 @override
 Color zero = const Color(0xFF000000);

 @override
 Color ten = const Color(0xFF333333);

 @override
 Color twenty = const Color(0xFF666666);

 @override
 Color forty = const Color(0xFF999999);

 @override
 Color sixty = const Color(0xFFCCCCCC);

 @override
 Color eighty = const Color(0xFFF6F6F6);

 @override
 Color hundred = const Color(0xFFFFFFFF);
}


class DSColorDanger implements ColorScaleBase {
  DSColorDanger({
    Color? zero,
    Color? ten,
    Color? twenty,
    Color? forty,
    Color? sixty,
    Color? eighty,
    Color? hundred,

  }) {
    this.zero = zero ?? this.zero;
    this.twenty = twenty ?? this.twenty;
    this.ten = ten ?? this.ten;
    this.forty = forty ?? this.forty;
    this.sixty = sixty ?? this.sixty;
    this.eighty = eighty ?? this.eighty;
    this.hundred = hundred ?? this.hundred;
  }

  @override
  Color zero = const Color(0xFFBD1023);

  @override
  Color ten = const Color(0xFFF11A4E);

  @override
  Color twenty = const Color(0xFFF5537A);

  @override
  Color forty = const Color(0xFFF88CA6);

  @override
  Color sixty = const Color(0xFFFBC6D3);

  @override
  Color eighty = const Color(0xFFf9d9e0);

  @override
  Color hundred = const Color(0xFFFFFFFF);
}

class DSColorInfo implements ColorScaleBase {
  DSColorInfo({
    Color? zero,
    Color? ten,
    Color? twenty,
    Color? forty,
    Color? sixty,
    Color? eighty,
    Color? hundred,
  }) {
    this.zero = zero ?? this.zero;
    this.ten = ten ?? this.ten;
    this.twenty = twenty ?? this.twenty;
    this.forty = forty ?? this.forty;
    this.sixty = sixty ?? this.sixty;
    this.eighty = eighty ?? this.eighty;
    this.hundred = hundred ?? this.hundred;
  }

  @override
  Color zero = const Color(0xFF0044CC);

  @override
  Color ten = const Color(0xFF3366FF);

  @override
  Color twenty = const Color(0xFF6699FF);

  @override
  Color forty = const Color(0xFF99BBFF);

  @override
  Color sixty = const Color(0xFFCCE0FF);

  @override
  Color eighty = const Color(0xFFE5F2FF);

  @override
  Color hundred = const Color(0xFFFFFFFF);
}


class DSColorWarning implements ColorScaleBase {
  DSColorWarning({
    Color? zero,
    Color? ten,
    Color? twenty,
    Color? forty,
    Color? sixty,
    Color? eighty,
    Color? hundred,

  }) {
    this.zero = zero ?? this.zero;
    this.ten = ten ?? this.ten;
    this.twenty = twenty ?? this.twenty;
    this.forty = forty ?? this.forty;
    this.sixty = sixty ?? this.sixty;
    this.eighty = eighty ?? this.eighty;
    this.hundred = hundred ?? this.hundred;
  }

  @override
  Color zero = const Color(0xFFC48402);

  @override
  Color ten = const Color(0xFFE39E28);

  @override
  Color twenty = const Color(0xFFFFB94D);

  @override
  Color forty = const Color(0xFFF6BF71);

  @override
  Color sixty = const Color(0xFFFFDDB2);

  @override
  Color eighty = const Color(0xFFFFEEDC);

  @override
  Color hundred = const Color(0xFFFFFFFF);

}

class DSColorStateLayerLight implements ColorStateLayerBase {
  DSColorStateLayerLight({
    Color? zero,
    Color? ten,
    Color? twenty,
  });

  @override
  Color high = const Color(0xFFD6D6D6);

  @override
  Color low = const Color(0xFFEBEBEB);

  @override
  Color medium = const Color(0xFFE0E0E0);
}

class DSColorStateLayerDark implements ColorStateLayerBase {
  DSColorStateLayerDark({
    Color? zero,
    Color? ten,
    Color? twenty,
  });

  @override
  Color high = const Color(0xFF29614E);

  @override
  Color low = const Color(0xFF29614E);

  @override
  Color medium = const Color(0xFF29614E);
}

