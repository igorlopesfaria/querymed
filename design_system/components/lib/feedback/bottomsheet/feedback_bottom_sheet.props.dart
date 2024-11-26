class DSFeedbackBottomSheetProps {
  DSFeedbackBottomSheetProps({
    required this.title,
    required this.description,
    required this.type,
    this.buttonText,
    this.onButtonPressed,
  });

  final String title;
  final String description;
  final DSFeedbackBottomSheetType type;
  final String? buttonText;
  void Function()? onButtonPressed;

}

enum DSFeedbackBottomSheetType {
  fatalError,
  connectionError
}
