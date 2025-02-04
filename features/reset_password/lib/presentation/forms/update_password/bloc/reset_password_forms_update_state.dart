part of 'reset_password_forms_update_cubit.dart';

abstract class ResetPasswordFormsUpdateState extends Equatable {}

class ResetPasswordFormsUpdateInitState extends ResetPasswordFormsUpdateState {
  @override
  List<Object?> get props => [];
}

class ResetPasswordFormsUpdateLoadingState extends ResetPasswordFormsUpdateState {
  @override
  List<Object?> get props => [];
}

class ResetPasswordFormsUpdateValidState extends ResetPasswordFormsUpdateState {
  @override
  List<Object?> get props => [];
}

class ResetPasswordUpdateSuccessState extends ResetPasswordFormsUpdateState {
  @override
  List<Object?> get props => [];
}

class ResetPasswordFormsUpdateBannerErrorState extends ResetPasswordFormsUpdateState {
  ResetPasswordFormsUpdateBannerErrorState({
    required this.bottomSheetProps
  });

  final DSFeedbackBottomSheetProps bottomSheetProps;

  @override
  List<Object?> get props => [bottomSheetProps];
}

class ResetPasswordFormsUpdateFieldErrorState extends ResetPasswordFormsUpdateState {
  final bool showText;
  ResetPasswordFormsUpdateFieldErrorState({required this.showText});

  @override
  List<Object?> get props => [showText];
}