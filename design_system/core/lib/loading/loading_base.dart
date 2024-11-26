class LoadingBase {
  LoadingBase({
    required this.size,
    required this.stroke,
  });

  LoadingSizeBase size;
  LoadingStrokeBase stroke;
}

class LoadingSizeBase {
  LoadingSizeBase({
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });

  double sm;
  double md;
  double lg;
  double xl;
}

class LoadingStrokeBase {
  LoadingStrokeBase(
      {required this.sm, required this.md, required this.lg, required this.xl});

  double sm;
  double md;
  double lg;
  double xl;
}
