
class DSSnackBarProps {
  DSSnackBarProps({required this.text, required this.type});

  final String text;
  final DSSnackBarType type;
}

enum DSSnackBarType {
  info,
  warning,
  danger,
  neutral;
}
