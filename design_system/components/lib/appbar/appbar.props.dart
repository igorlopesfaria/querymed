import 'package:flutter/material.dart';

class DSAppBarProps {
  DSAppBarProps({
    this.title,
    this.iconLeading,
    this.menuItem,
    required this.type,
    this.onPressedMenuItem,
    this.onPressedIconLeading,
    this.current,
    this.max
  });
  final String? title;
  final IconData? iconLeading;
  final IconData? menuItem;
  final DSAppBarType type;
  final void Function()? onPressedMenuItem;
  final void Function()? onPressedIconLeading;
  final double? max;
  final double? current;

}

enum DSAppBarType {
  light,
  dark
}
