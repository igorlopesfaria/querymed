import 'package:design_system_components/text/text.dart';
import 'package:design_system_core/text/text_base.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:flutter/material.dart';

class DSTextStyle {
  final token = DSTokenProvider().provide();

  TextStyle customTextStyle(DSTypographyStyleType styleType) {
    Map<DSTypographyStyleType, TextCharacteristicBase> textStyles = {
      DSTypographyStyleType.t10Bold: token.text.t10Bold,
      DSTypographyStyleType.t10SemiBold: token.text.t10SemiBold,
      DSTypographyStyleType.t10Medium: token.text.t10Medium,
      DSTypographyStyleType.t10Regular: token.text.t10Regular,
      DSTypographyStyleType.t12Bold: token.text.t12Bold,
      DSTypographyStyleType.t12SemiBold: token.text.t12SemiBold,
      DSTypographyStyleType.t12Medium: token.text.t12Medium,
      DSTypographyStyleType.t12Regular: token.text.t12Regular,
      DSTypographyStyleType.t14Bold: token.text.t14Bold,
      DSTypographyStyleType.t14SemiBold: token.text.t14SemiBold,
      DSTypographyStyleType.t14Medium: token.text.t14Medium,
      DSTypographyStyleType.t14Regular: token.text.t14Regular,
      DSTypographyStyleType.t16Bold: token.text.t16Bold,
      DSTypographyStyleType.t16SemiBold: token.text.t16SemiBold,
      DSTypographyStyleType.t16Medium: token.text.t16Medium,
      DSTypographyStyleType.t16Regular: token.text.t16Regular,
      DSTypographyStyleType.t20Bold: token.text.t20Bold,
      DSTypographyStyleType.t20SemiBold: token.text.t20SemiBold,
      DSTypographyStyleType.t20Medium: token.text.t20Medium,
      DSTypographyStyleType.t20Regular: token.text.t20Regular,
      DSTypographyStyleType.t24Bold: token.text.t24Bold,
      DSTypographyStyleType.t24SemiBold: token.text.t24SemiBold,
      DSTypographyStyleType.t24Medium: token.text.t24Medium,
      DSTypographyStyleType.t24Regular: token.text.t24Regular,
      DSTypographyStyleType.h32Bold: token.text.h32Bold,
      DSTypographyStyleType.h32SemiBold: token.text.h32SemiBold,
      DSTypographyStyleType.h32Medium: token.text.h32Medium,
      DSTypographyStyleType.h32Regular: token.text.h32Regular,
      DSTypographyStyleType.h36Bold: token.text.h36Bold,
      DSTypographyStyleType.h36SemiBold: token.text.h36SemiBold,
      DSTypographyStyleType.h36Medium: token.text.h36Medium,
      DSTypographyStyleType.h36Regular: token.text.h36Regular,
      DSTypographyStyleType.h40Bold: token.text.h40Bold,
      DSTypographyStyleType.h40SemiBold: token.text.h40SemiBold,
      DSTypographyStyleType.h40Medium: token.text.h40Medium,
      DSTypographyStyleType.h40Regular: token.text.h40Regular,
    };

    if (!textStyles.containsKey(styleType)) {
      throw ArgumentError('Invalid style type: $styleType');
    }

    TextCharacteristicBase selectedStyle = textStyles[styleType]!;

    return TextStyle(
      fontFamily: selectedStyle.fontFamily,
      fontSize: selectedStyle.fontSize,
      height: 1.1,
      letterSpacing: selectedStyle.letter,
      fontWeight: selectedStyle.fontWeight,
    );
  }

}
