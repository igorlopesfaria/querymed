import 'package:design_system_core/font/ds_font.dart';
import 'package:design_system_core/font/font_base.dart';
import 'package:design_system_core/text/text_base.dart';
import 'package:flutter/material.dart';

class DST10Bold implements TextCharacteristicBase {
  DST10Bold({
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    double? lineHeight,
    double? letter
  }) {
    this.fontSize = fontSize ?? this.fontSize;
    this.fontFamily = fontFamily ?? this.fontFamily;
    this.fontWeight = fontWeight ?? this.fontWeight;
    this.lineHeight = lineHeight ?? this.lineHeight;
    this.letter = letter ?? this.letter;
  }

  FontBase fontBase = DSFont();

  @override
  late String fontFamily = fontBase.family.poppins;

  @override
  late double fontSize = fontBase.size.t10;

  @override
  late FontWeight fontWeight = fontBase.weight.bold;

  @override
  late double lineHeight = fontBase.lineHeight.l12;

  @override
  late double letter = 0.3;

}

class DST10SemiBold implements TextCharacteristicBase {
  DST10SemiBold({
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    double? lineHeight,
    double? letter
  }) {
    this.fontSize = fontSize ?? this.fontSize;
    this.fontFamily = fontFamily ?? this.fontFamily;
    this.fontWeight = fontWeight ?? this.fontWeight;
    this.lineHeight = lineHeight ?? this.lineHeight;
    this.letter = letter ?? this.letter;
  }

  FontBase fontBase = DSFont();

  @override
  late String fontFamily = fontBase.family.poppins;

  @override
  late double fontSize = fontBase.size.t10;

  @override
  late FontWeight fontWeight = fontBase.weight.semiBold;

  @override
  late double lineHeight = fontBase.lineHeight.l12;

  @override
  late double letter = 0.3;

}

class DST10Medium implements TextCharacteristicBase {
  DST10Medium({
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    double? lineHeight,
    double? letter
  }) {
    this.fontSize = fontSize ?? this.fontSize;
    this.fontFamily = fontFamily ?? this.fontFamily;
    this.fontWeight = fontWeight ?? this.fontWeight;
    this.lineHeight = lineHeight ?? this.lineHeight;
    this.letter = letter ?? this.letter;
  }

  FontBase fontBase = DSFont();

  @override
  late String fontFamily = fontBase.family.poppins;

  @override
  late double fontSize = fontBase.size.t10;

  @override
  late FontWeight fontWeight = fontBase.weight.medium;

  @override
  late double lineHeight = fontBase.lineHeight.l12;

  @override
  late double letter = 0.3;

}

class DST10Regular implements TextCharacteristicBase {
  DST10Regular({
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    double? lineHeight,
    double? letter
  }) {
    this.fontSize = fontSize ?? this.fontSize;
    this.fontFamily = fontFamily ?? this.fontFamily;
    this.fontWeight = fontWeight ?? this.fontWeight;
    this.lineHeight = lineHeight ?? this.lineHeight;
    this.letter = letter ?? this.letter;
  }

  FontBase fontBase = DSFont();

  @override
  late String fontFamily = fontBase.family.poppins;

  @override
  late double fontSize = fontBase.size.t10;

  @override
  late FontWeight fontWeight = fontBase.weight.regular;

  @override
  late double lineHeight = fontBase.lineHeight.l12;

  @override
  late double letter = 0.3;

}