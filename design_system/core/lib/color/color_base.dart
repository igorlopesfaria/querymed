import 'dart:ui';

class ColorBase {
  ColorBase({
    required this.primaryBase,
    required this.secondaryBase,
    required this.neutralBase,
    required this.dangerBase,
    required this.warningBase,
    required this.infoBase,

    required this.stateLayerLight,
    required this.stateLayerDark,
    required this.black,
    required this.white
  });

  ColorScaleBase primaryBase;
  ColorScaleBase secondaryBase;
  ColorScaleBase neutralBase;
  ColorScaleBase dangerBase;
  ColorScaleBase warningBase;
  ColorScaleBase infoBase;
  ColorStateLayerBase stateLayerLight;
  ColorStateLayerBase stateLayerDark;
  Color black;
  Color white;
}

class ColorStateLayerBase {
  ColorStateLayerBase({
    required this.low,
    required this.medium,
    required this.high
  });

  Color low;
  Color medium;
  Color high;
}

class ColorScaleBase {
  ColorScaleBase({
    required this.zero,
    required this.ten,
    required this.twenty,
    required this.forty,
    required this.sixty,
    required this.eighty,
    required this.hundred,
  });

  Color zero;
  Color ten;
  Color twenty;
  Color forty;
  Color sixty;
  Color eighty;
  Color hundred;
}