import 'dart:ui';

import 'package:flutter/widgets.dart';

class DSTextProps {
  DSTextProps({
    required this.text,
    required this.typographyStyle,
    required this.typographyColor,
    required this.textAlign,
    required this.decoration,
    this.maxLines,
    this.overflow
  });

  final String text;
  final DSTypographyStyleType typographyStyle;
  final Color typographyColor;
  final TextAlign textAlign;
  final int? maxLines;
  final TextDecoration decoration;
  final TextOverflow? overflow;
}

enum DSTypographyStyleType {
  t10Bold,
  t10SemiBold,
  t10Medium,
  t10Regular,
  t12Bold,
  t12SemiBold,
  t12Medium,
  t12Regular,
  t14Bold,
  t14SemiBold,
  t14Medium,
  t14Regular,
  t16Bold,
  t16SemiBold,
  t16Medium,
  t16Regular,
  t20Bold,
  t20SemiBold,
  t20Medium,
  t20Regular,
  t24Bold,
  t24SemiBold,
  t24Medium,
  t24Regular,
  h32Bold,
  h32SemiBold,
  h32Medium,
  h32Regular,
  h36Bold,
  h36SemiBold,
  h36Medium,
  h36Regular,
  h40Bold,
  h40SemiBold,
  h40Medium,
  h40Regular;
}

enum DSTypographyColorType {
  primary,
  secondary,
  dark,
  light,
  error,
}
