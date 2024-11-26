import 'package:equatable/equatable.dart';

abstract class OnboardingSplashState extends Equatable {}

class OnboardingSplashInitState extends OnboardingSplashState {
  @override
  List<Object?> get props => [];
}

class OnboardingSplashUserRegisteredState extends OnboardingSplashState {
  @override
  List<Object?> get props => [];

}

class OnboardingSplashUserNotRegisteredState extends OnboardingSplashState {
  OnboardingSplashUserNotRegisteredState({required this.isFirstAccess});

  final bool isFirstAccess;

  @override
  List<Object?> get props => [isFirstAccess];

}


class OnboardingSplashForceUpdateState extends OnboardingSplashState{
  @override
  List<Object?> get props => [];
}
