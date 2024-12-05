import 'package:flutter/widgets.dart';

class DSSelectListProps {
  DSSelectListProps({
    required this.hint,
    this.text,
    this.onPressed,
    this.iconRight,
    this.iconLeft,
    required this.imagePathLeft,
  });

  final String hint;
  final String? text;
  final String? imagePathLeft;
  final IconData? iconRight;
  final IconData? iconLeft;
  final void Function()? onPressed;
}
