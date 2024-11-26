class CheckboxBase {
  CheckboxBase({
    required this.size,
    required this.border,
  });

  final CheckboxSizeBase size;
  final CheckboxBorderBase border;
}

class CheckboxSizeBase {
  CheckboxSizeBase({
    required this.sm,
    required this.md,
    required this.lg
  });

  final double sm;
  final double md;
  final double lg;
}

class CheckboxBorderBase {
  CheckboxBorderBase({
    required this.sm,
    required this.md,
    required this.lg
  });

  final double sm;
  final double md;
  final double lg;
}
