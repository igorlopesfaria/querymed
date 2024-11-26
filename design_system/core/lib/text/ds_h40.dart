import 'package:design_system_core/font/ds_font.dart';
import 'package:design_system_core/font/font_base.dart';
import 'package:design_system_core/text/text_base.dart';
import 'package:flutter/material.dart';

class DSH40Bold implements TextCharacteristicBase {
  DSH40Bold({
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
  late double fontSize = fontBase.size.h40;

  @override
  late FontWeight fontWeight = fontBase.weight.bold;

  @override
  late double lineHeight = fontBase.lineHeight.l44;

  @override
  late double letter = -1;

}

class DSH40SemiBold implements TextCharacteristicBase {
  DSH40SemiBold({
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
  late double fontSize = fontBase.size.h40;

  @override
  late FontWeight fontWeight = fontBase.weight.semiBold;

  @override
  late double lineHeight = fontBase.lineHeight.l44;

  @override
  late double letter = -1;

}

class DSH40Medium implements TextCharacteristicBase {
  DSH40Medium({
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
  late double fontSize = fontBase.size.h40;

  @override
  late FontWeight fontWeight = fontBase.weight.medium;

  @override
  late double lineHeight = fontBase.lineHeight.l44;

  @override
  late double letter = -1;

}

class DSH40Regular implements TextCharacteristicBase {
  DSH40Regular({
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
  late double fontSize = fontBase.size.h40;

  @override
  late FontWeight fontWeight = fontBase.weight.regular;

  @override
  late double lineHeight = fontBase.lineHeight.l44;

  @override
  late double letter = -1;

}