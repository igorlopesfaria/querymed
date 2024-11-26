import 'dart:ui';

import 'package:design_system_core/color/ds_material_color.dart';
import 'package:design_system_core/color/material_color_base.dart';
import 'package:design_system_core/font/font_base.dart';

class DSFont implements FontBase {
  @override
  FontFamilyBase family = DSFontFamily();

  @override
  FontSizeBase size = DSFontSize();

  @override
  FontWeightBase weight = DSFontWeight();

  @override
  MaterialColorBase color = DSMaterialColor();

  @override
  FontLineHeightBase lineHeight = DSFontLineHeight();
}

class DSFontFamily implements FontFamilyBase {
  DSFontFamily({
    String? poppins,
  }) {
    this.poppins = poppins ?? this.poppins;
  }

  @override
  String poppins = 'Poppins';
}

class DSFontSize implements FontSizeBase {
  DSFontSize({
    double? t10,
    double? t12,
    double? t14,
    double? t16,
    double? t20,
    double? t24,
    double? h32,
    double? h36,
    double? h40
  }) {
    t10 = t10 ?? this.t10;
    t12 = t12 ?? this.t12;
    t14 = t14 ?? this.t14;
    t16 = t16 ?? this.t16;
    t20 = t20 ?? this.t20;
    t24 = t24 ?? this.t24;
    h32 = h32 ?? this.h32;
    h36 = h36 ?? this.h36;
    h40 = h40 ?? this.h40;
  }

  @override
  double t10 = 10;

  @override
  double t12 = 12;

  @override
  double t14 = 14;

  @override
  double t16 = 16;

  @override
  double t20 = 20;

  @override
  double t24 = 24;

  @override
  double h32 = 32;

  @override
  double h36 = 36;

  @override
  double h40 = 40;
}

class DSFontWeight implements FontWeightBase {
  DSFontWeight({
    FontWeight? regular,
    FontWeight? medium,
    FontWeight? semiBold,
    FontWeight? bold,

  }) {
    regular = regular ?? this.regular;
    medium = medium ?? this.medium;
    semiBold = semiBold ?? this.semiBold;
    bold = bold ?? this.bold;
  }


  @override
  FontWeight regular = FontWeight.w400;

  @override
  FontWeight medium = FontWeight.w500;

  @override
  FontWeight semiBold = FontWeight.w600;

  @override
  FontWeight bold = FontWeight.w700;
}

class DSFontLineHeight implements FontLineHeightBase {
  DSFontLineHeight({
    double? l12,
    double? l16,
    double? l20,
    double? l24,
    double? l28,
    double? l32,
    double? l36,
    double? l44
  }) {
    l12 = l12 ?? this.l12;
    l16 = l16 ?? this.l16;
    l20 = l20 ?? this.l20;
    l24 = l24 ?? this.l24;
    l28 = l28 ?? this.l28;
    l32 = l32 ?? this.l32;
    l36 = l36 ?? this.l36;
    l44 = l44 ?? this.l44;
  }

  @override
  double l12 = 12;

  @override
  double l16 = 16;

  @override
  double l20 = 20;

  @override
  double l24 = 24;

  @override
  double l28 = 28;

  @override
  double l32 = 32;

  @override
  double l36 = 36;

  @override
  double l44 = 44;
}
