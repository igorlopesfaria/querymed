import 'package:flutter/material.dart';

class DSTextFieldProps {
  DSTextFieldProps({
    required this.hintText,
    required this.autofocus,
    required this.enable,
    required this.textCapitalization,
    this.messageError,
    required this.textAlign,
    this.isPassword,
    this.typeMask,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.leadingIcon,
    this.trailingIcon,
    this.trailingIconClick,
    this.onSubmitted,
    this.onTextChanged,
    this.maxLength,
    this.focusNode
  });

  final TextCapitalization textCapitalization;
  final bool autofocus;
  final bool enable;
  final int? maxLength;
  final String hintText;
  final bool? isPassword;
  final String? messageError;
  final TextAlign textAlign;
  final DSTextFieldMaskType? typeMask;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Icon? leadingIcon;
  final Icon? trailingIcon;
  final Function()? trailingIconClick;
  final Function(String)? onSubmitted;
  final Function(String)? onTextChanged;
  final FocusNode? focusNode; // New parameter

}

enum DSTextFieldMaskType {
  empty,
  cep,
  cpf,
  cnpj,
  password,
  phone,
}
