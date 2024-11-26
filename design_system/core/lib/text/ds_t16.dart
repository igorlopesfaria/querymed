import 'package:design_system_core/font/ds_font.dart';
import 'package:design_system_core/font/font_base.dart';
import 'package:design_system_core/text/text_base.dart';
import 'package:flutter/material.dart';

class DST16Bold implements TextCharacteristicBase {
  DST16Bold({
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
  late double fontSize = fontBase.size.t16;

  @override
  late FontWeight fontWeight = fontBase.weight.bold;

  @override
  late double lineHeight = fontBase.lineHeight.l24;

  @override
  late double letter = -0.6;

}

class DST16SemiBold implements TextCharacteristicBase {
  DST16SemiBold({
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
  late double fontSize = fontBase.size.t16;

  @override
  late FontWeight fontWeight = fontBase.weight.semiBold;

  @override
  late double lineHeight = fontBase.lineHeight.l24;

  @override
  late double letter = -0.6;

}

class DST16Medium implements TextCharacteristicBase {
  DST16Medium({
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
  late double fontSize = fontBase.size.t16;

  @override
  late FontWeight fontWeight = fontBase.weight.medium;

  @override
  late double lineHeight = fontBase.lineHeight.l24;

  @override
  late double letter = -0.6;

}

class DST16Regular implements TextCharacteristicBase {
  DST16Regular({
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
  late double fontSize = fontBase.size.t16;

  @override
  late FontWeight fontWeight = fontBase.weight.regular;

  @override
  late double lineHeight = fontBase.lineHeight.l24;

  @override
  late double letter = -0.6;

}