import 'dart:ui';

import 'package:design_system_core/font/font_base.dart';

class TextBase {
  TextBase({
    required this.t10Bold,
    required this.t10SemiBold,
    required this.t10Medium,
    required this.t10Regular,
    required this.t12Bold,
    required this.t12SemiBold,
    required this.t12Medium,
    required this.t12Regular,
    required this.t14Bold,
    required this.t14SemiBold,
    required this.t14Medium,
    required this.t14Regular,
    required this.t16Bold,
    required this.t16SemiBold,
    required this.t16Medium,
    required this.t16Regular,
    required this.t20Bold,
    required this.t20SemiBold,
    required this.t20Medium,
    required this.t20Regular,
    required this.t24Bold,
    required this.t24SemiBold,
    required this.t24Medium,
    required this.t24Regular,
    required this.h32Bold,
    required this.h32SemiBold,
    required this.h32Medium,
    required this.h32Regular,
    required this.h36Bold,
    required this.h36SemiBold,
    required this.h36Medium,
    required this.h36Regular,
    required this.h40Bold,
    required this.h40SemiBold,
    required this.h40Medium,
    required this.h40Regular,
  });

  final TextCharacteristicBase t10Bold;
  final TextCharacteristicBase t10SemiBold;
  final TextCharacteristicBase t10Medium;
  final TextCharacteristicBase t10Regular;
  final TextCharacteristicBase t12Bold;
  final TextCharacteristicBase t12SemiBold;
  final TextCharacteristicBase t12Medium;
  final TextCharacteristicBase t12Regular;
  final TextCharacteristicBase t14Bold;
  final TextCharacteristicBase t14SemiBold;
  final TextCharacteristicBase t14Medium;
  final TextCharacteristicBase t14Regular;
  final TextCharacteristicBase t16Bold;
  final TextCharacteristicBase t16SemiBold;
  final TextCharacteristicBase t16Medium;
  final TextCharacteristicBase t16Regular;
  final TextCharacteristicBase t20Bold;
  final TextCharacteristicBase t20SemiBold;
  final TextCharacteristicBase t20Medium;
  final TextCharacteristicBase t20Regular;
  final TextCharacteristicBase t24Bold;
  final TextCharacteristicBase t24SemiBold;
  final TextCharacteristicBase t24Medium;
  final TextCharacteristicBase t24Regular;
  final TextCharacteristicBase h32Bold;
  final TextCharacteristicBase h32SemiBold;
  final TextCharacteristicBase h32Medium;
  final TextCharacteristicBase h32Regular;
  final TextCharacteristicBase h36Bold;
  final TextCharacteristicBase h36SemiBold;
  final TextCharacteristicBase h36Medium;
  final TextCharacteristicBase h36Regular;
  final TextCharacteristicBase h40Bold;
  final TextCharacteristicBase h40SemiBold;
  final TextCharacteristicBase h40Medium;
  final TextCharacteristicBase h40Regular;

}

class TextCharacteristicBase {
  TextCharacteristicBase({
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    required this.lineHeight,
    required this.letter,
  });

  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final double lineHeight;
  final double letter;
}
