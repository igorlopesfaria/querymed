class TextFieldBase {
  TextFieldBase({required this.height});

  final TextFieldHeightBase height;
}

class TextFieldHeightBase {
  TextFieldHeightBase({
    required this.sm,
    required this.md,
    required this.lg,
  });

  final double sm;
  final double md;
  final double lg;
}
