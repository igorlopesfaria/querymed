import 'package:design_system_components/textfield/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DSTextFiledWidget extends StatefulWidget {
  DSTextFiledWidget({
    super.key,
    int? maxLength,
    String hintText = '',
    String? messageError,
    bool enable = true,
    bool autofocus = false,
    bool? isPassword = false,
    TextEditingController? controller,
    DSTextFieldMaskType? typeMask = DSTextFieldMaskType.empty,
    TextInputType? keyboardType = TextInputType.text,
    TextInputAction? textInputAction,
    Icon? leadingIcon,
    Icon? trailingIcon,
    Function()? trailingIconClick,
    Function(String)? onSubmitted,
    Function(String)? onTextChanged,
    TextCapitalization textCapitalization = TextCapitalization.none
  }) : props = DSTextFieldProps(
    hintText: hintText,
    autofocus: autofocus,
    messageError: messageError,
    enable: enable,
    isPassword: isPassword,
    typeMask: typeMask,
    controller: controller,
    keyboardType: keyboardType,
    textInputAction: textInputAction,
    leadingIcon: leadingIcon,
    trailingIconClick: trailingIconClick,
    trailingIcon: trailingIcon,
    onSubmitted: onSubmitted,
    onTextChanged: onTextChanged,
    textCapitalization: textCapitalization,
    maxLength: maxLength,
  );

  @override
  State<DSTextFiledWidget> createState() => _DSTextFiledWidget();

  final DSTextFieldProps props;
}

class _DSTextFiledWidget extends State<DSTextFiledWidget> {
  final style = DSTextFieldStyle();
  
  late bool showPasswordText;
  @override
  void initState() {
    super.initState();
    showPasswordText = widget.props.isPassword ?? false;
  }

  void togglePasswordIcon() {
    setState(() {
      showPasswordText = !showPasswordText;
    });
  }


  
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: widget.props.maxLength,
      onChanged: (text) {
        widget.props.onTextChanged?.call(text);
      },
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      textCapitalization: widget.props.textCapitalization,
      enabled: widget.props.enable,
      autofocus: widget.props.autofocus,
      controller: widget.props.controller,
      keyboardType: widget.props.keyboardType,
      style: TextStyle(
          fontSize: style.token.text.t14Regular.fontSize,
          fontFamily: style.token.text.t14Regular.fontFamily,
          letterSpacing: style.token.text.t14Regular.letter,
          fontWeight: style.token.text.t14Regular.fontWeight,
          color: (widget.props.enable)
              ? style.token.color.onSurfaceHigh
              : style.token.color.onSurfaceLow),
      onSubmitted: widget.props.onSubmitted,
      cursorColor: style.cursorColor,
      obscureText: showPasswordText,
      textInputAction: widget.props.textInputAction,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        hintText: widget.props.hintText,
        prefixIcon: widget.props.leadingIcon,
        suffixIcon: _setSuffixIcon(style, widget.props.trailingIcon),
        counterText: '',
        errorStyle: TextStyle(
          fontSize: style.token.text.t12Regular.fontSize,
          fontFamily: style.token.text.t12Regular.fontFamily,
          letterSpacing: style.token.text.t12Regular.letter,
          fontWeight: style.token.text.t12Regular.fontWeight,
          color: style.token.color.danger,
        ),
        hintStyle: TextStyle(
          fontSize: style.token.text.t14Regular.fontSize,
          fontFamily: style.token.text.t14Regular.fontFamily,
          letterSpacing: style.token.text.t14Regular.letter,
          fontWeight: style.token.text.t14Regular.fontWeight,
          color: widget.props.messageError == null || widget.props.messageError == ''
              ? style.token.color.onSurfaceLow : style.token.color.danger,
        ),
        contentPadding: EdgeInsets.symmetric(
            vertical: style.verticalPadding,
            horizontal: style.horizontalPadding),
        filled: true,
        fillColor: style.backgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            style.borderRadius,
          ),
          borderSide: BorderSide(
            color: style.borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            style.borderRadius,
          ),
          borderSide: BorderSide(
            color: style.borderColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            style.borderRadius,
          ),
          borderSide: BorderSide(color: style.borderColorError, width: 2),
        ),
        errorText: widget.props.messageError,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            style.borderRadius,
          ),
          borderSide: BorderSide(color: style.borderColorFocus, width: 2),
        ),
      ),
      inputFormatters: (widget.props.isPassword == true)
          ? [FilteringTextInputFormatter.deny(RegExp(r'\s'))]
          : style.getTextInputFormatter(
              widget.props.typeMask ?? DSTextFieldMaskType.empty
            ),
    );
  }

  Widget? _setSuffixIcon(DSTextFieldStyle style, Icon? trailingIcon) {
    if (trailingIcon != null) {
      return GestureDetector(
          child: trailingIcon,
          onTap: () {
            widget.props.trailingIconClick?.call();
          });
    } else if (widget.props.isPassword == true) {
      return IconButton(
        icon: Icon(
          showPasswordText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: widget.props.messageError == null ||
                  widget.props.messageError == ''
              ? style.token.color.primary
              : style.token.color.danger,
        ),
        onPressed: () {
          togglePasswordIcon();
        },
      );
    } else {
      return null;
    }
  }
}
