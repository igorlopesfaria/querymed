class DividerBase {
  DividerBase({required this.height});

  final DividerHeightBase height;
}

class DividerHeightBase {
  DividerHeightBase({
    required this.sm,
    required this.md,
    required this.lg,
  });

  final double sm;
  final double md;
  final double lg;
}
