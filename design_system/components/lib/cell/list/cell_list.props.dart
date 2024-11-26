import 'package:flutter/widgets.dart';

class DSCellListProps {
  DSCellListProps({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.iconLeft,
    this.onPressed,
    this.iconRight,
  });

  final String title;
  final String? description;
  final String? imagePath;
  final IconData? iconLeft;
  final IconData? iconRight;
  final void Function()? onPressed;
}
