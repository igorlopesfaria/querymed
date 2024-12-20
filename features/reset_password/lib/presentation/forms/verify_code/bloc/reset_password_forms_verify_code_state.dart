import 'package:commons_media_validation/domain/model/media_validation.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.dart';
import 'package:equatable/equatable.dart';

abstract class ResetPasswordFormsVerifyCodeState extends Equatable {}

class ResetPasswordFormsVerifyCodeInitState extends ResetPasswordFormsVerifyCodeState {
  @override
  List<Object?> get props => [];
}

class ResetPasswordFormsVerifyCodeLoadingState extends ResetPasswordFormsVerifyCodeState {
  @override
  List<Object?> get props => [];
}

class ResetPasswordFormsVerifyCodeValidState extends ResetPasswordFormsVerifyCodeState {
  @override
  List<Object?> get props => [];
}

class ResetPasswordFormsVerifyCodeSuccessState extends ResetPasswordFormsVerifyCodeState {

  ResetPasswordFormsVerifyCodeSuccessState();
  @override
  List<Object?> get props => [];
}

class ResetPasswordFormsVerifyCodeBannerErrorState extends ResetPasswordFormsVerifyCodeState {

  ResetPasswordFormsVerifyCodeBannerErrorState({
    required this.bottomSheetProps
  });

  final DSFeedbackBottomSheetProps bottomSheetProps;

  @override
  List<Object?> get props => [bottomSheetProps];
}


class ResetPasswordFormsVerifyCodeFieldErrorState
    extends ResetPasswordFormsVerifyCodeState {

  ResetPasswordFormsVerifyCodeFieldErrorState({
    required this.showText
  });

  final bool showText;

  @override
  List<Object?> get props => [showText];
}
