import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.dart';
import 'package:equatable/equatable.dart';

abstract class LoginBiometryState extends Equatable {}

class LoginBiometryInitState extends LoginBiometryState {
  @override
  List<Object?> get props => [];
}

class LoginBiometryCancelState extends LoginBiometryState {
  @override
  List<Object?> get props => [];
}

class LoginBiometryLoadingState extends LoginBiometryState {
  @override
  List<Object?> get props => [];
}

class LoginBiometryValidState extends LoginBiometryState {
  @override
  List<Object?> get props => [];
}


class LoginBiometrySuccessState extends LoginBiometryState {
  LoginBiometrySuccessState(this.route);
  final String route;
  @override
  List<Object?> get props => [route];
}

class LoginBiometryBannerErrorState extends LoginBiometryState {

  LoginBiometryBannerErrorState({required this.bottomSheetProps});

  final DSFeedbackBottomSheetProps bottomSheetProps;

  @override
  List<Object?> get props => [bottomSheetProps];
}

class LoginBiometrySnackErrorState
    extends LoginBiometryState {
  LoginBiometrySnackErrorState({required this.messageError});

  final String messageError;
  @override
  List<Object?> get props => [messageError];
}




