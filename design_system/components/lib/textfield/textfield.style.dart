import 'package:brasil_fields/brasil_fields.dart';
import 'package:design_system_components/textfield/textfield.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:flutter/services.dart';


class DSTextFieldStyle {
  DSTextFieldStyle();

  final token = DSTokenProvider().provide();

  static const double heightBox = 56.0;

  // late final box = Mix(
  //   height(heightBox),
  //   paddingHorizontal(horizontalPadding),
  //   paddingVertical(verticalPadding),
  // );

  late final verticalPadding = token.spacing.xs;
  late final horizontalPadding = token.spacing.xs;
  late final borderRadius = token.radius.sm;
  late final cursorColor = token.color.primaryDark;
  late final backgroundColor = token.color.white;
  late final borderColor = token.color.primary;
  late final borderColorFocus = token.color.primaryDark;
  late final borderColorHint = token.color.onSurfaceHigh;
  late final borderColorError = token.color.danger;

  List<TextInputFormatter>? getTextInputFormatter(DSTextFieldMaskType mask) {
    switch (mask) {
      case DSTextFieldMaskType.cpf:
        return [
          FilteringTextInputFormatter.digitsOnly,
          CpfInputFormatter(),
        ];
      case DSTextFieldMaskType.cnpj:
        return [
          FilteringTextInputFormatter.digitsOnly,
          CnpjInputFormatter(),
        ];
      case DSTextFieldMaskType.cep:
        return [
          FilteringTextInputFormatter.digitsOnly,
          CepInputFormatter(),
        ];
      case DSTextFieldMaskType.phone:
        return [
          FilteringTextInputFormatter.digitsOnly,
          TelefoneInputFormatter(),
        ];
      default:
        return null;
    }
  }


}
