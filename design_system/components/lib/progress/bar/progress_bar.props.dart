class DSProgressBarProps {
  DSProgressBarProps(
      {required this.max,
        required this.current,
        required this.backgroundType,
        required this.indicatorType,
      });

  final double max;
  final double current;
  final DSProgressBarBackgroundType backgroundType;
  final DSProgressBarIndicatorType indicatorType;

}
enum DSProgressBarIndicatorType {
  primary,
  secondary;
}

enum DSProgressBarBackgroundType {
  light,
  dark;
}