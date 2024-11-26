import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.dart';
import 'package:equatable/equatable.dart';

abstract class LoginDefaultState extends Equatable {}

class LoginInitState extends LoginDefaultState {
  @override
  List<Object?> get props => [];
}

class LoginDefaultLoadingState extends LoginDefaultState {
  LoginDefaultLoadingState();

  @override
  List<Object?> get props => [];
}

class LoginDefaultFieldErrorState extends LoginDefaultState {
  LoginDefaultFieldErrorState({this.messageErrorEmail, this.messageErrorPassword});

  final String? messageErrorEmail;
  final String? messageErrorPassword;

  @override
  List<Object?> get props => [messageErrorEmail, messageErrorPassword];
}

class LoginDefaultBannerErrorState extends LoginDefaultState {

  LoginDefaultBannerErrorState({required this.bottomSheetProps});

  final DSFeedbackBottomSheetProps bottomSheetProps;

  @override
  List<Object?> get props => [bottomSheetProps];
}

class LoginDefaultSnackErrorState
    extends LoginDefaultState {
  LoginDefaultSnackErrorState({required this.messageError});

  final String messageError;
  @override
  List<Object?> get props => [messageError];
}

class LoginDefaultSuccessState
    extends LoginDefaultState {
  LoginDefaultSuccessState({required this.route});

  final String route;
  @override
  List<Object?> get props => [route];
}




