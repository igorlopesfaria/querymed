import 'feedback_bottom_sheet.props.dart';

DSFeedbackBottomSheetProps getConnectionBannerErrorProps() {
  return DSFeedbackBottomSheetProps(
      title: DSFeedbackBottomSheetConnectionErrorString.title,
      description: DSFeedbackBottomSheetConnectionErrorString.description,
      buttonText: DSFeedbackBottomSheetConnectionErrorString.textButton,
      type: DSFeedbackBottomSheetType.connectionError
  );
}

DSFeedbackBottomSheetProps getGenericBannerErrorProps() {
  return DSFeedbackBottomSheetProps(
      title: DSFeedbackBottomSheetGenericErrorString.title,
      description: DSFeedbackBottomSheetGenericErrorString.description,
      buttonText: DSFeedbackBottomSheetGenericErrorString.textButton,
      type: DSFeedbackBottomSheetType.fatalError
  );
}

class DSFeedbackBottomSheetGenericErrorString {
  static const title = 'Algo deu errado!';
  static const description = 'Infelizmente não conseguimos processar sua requisição. Tente novamente ou entre em contato com nosso suporte.';
  static const textButton = 'Tentar novamente';
}

class DSFeedbackBottomSheetConnectionErrorString {
  static const title = 'Verifique sua conexão';
  static const description = 'Seu aparelho está sem conexão com Internet. Verifique e tente novamente quando restabilizar.';
  static const textButton = 'Tentar novamente';
}
