import 'package:commons_media_validation/domain/model/media_validation.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.props.dart';
import 'package:equatable/equatable.dart';

abstract class ResetPasswordFormsUsernameState extends Equatable {}

class ResetPasswordFormsUsernameInitState extends ResetPasswordFormsUsernameState {
  @override
  List<Object?> get props => [];
}

class ResetPasswordFormsUsernameLoadingState extends ResetPasswordFormsUsernameState {
  @override
  List<Object?> get props => [];
}

class ResetPasswordFormsUsernameValidState extends ResetPasswordFormsUsernameState {
  @override
  List<Object?> get props => [];
}

class ResetPasswordFormsUsernameSuccessState extends ResetPasswordFormsUsernameState {
  ResetPasswordFormsUsernameSuccessState(this.mediaValidation);
  final MediaValidation mediaValidation;
  @override
  List<Object?> get props => [mediaValidation];
}

class ResetPasswordFormsUsernameBannerErrorState extends ResetPasswordFormsUsernameState {

  ResetPasswordFormsUsernameBannerErrorState({
    required this.bottomSheetProps
  });

  final DSFeedbackBottomSheetProps bottomSheetProps;

  @override
  List<Object?> get props => [bottomSheetProps];
}


class ResetPasswordFormsUsernameFieldErrorState
    extends ResetPasswordFormsUsernameState {
  ResetPasswordFormsUsernameFieldErrorState(this.messageError);

  final String messageError;
  @override
  List<Object?> get props => [messageError];
}

