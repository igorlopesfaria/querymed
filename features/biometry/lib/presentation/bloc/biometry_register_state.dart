import 'package:equatable/equatable.dart';

abstract class BiometryRegisterState extends Equatable {}

class BiometryRegisterInitState extends BiometryRegisterState {
  @override
  List<Object?> get props => [];
}

class BiometryRegisterLoadingState extends BiometryRegisterState {
  @override
  List<Object?> get props => [];
}

class BiometryRegisterCancelState extends BiometryRegisterState {
  @override
  List<Object?> get props => [];
}

class BiometryRegisterSnackErrorState extends BiometryRegisterState {
  BiometryRegisterSnackErrorState({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

class BiometryRegisterSuccessState extends BiometryRegisterState {
  @override
  List<Object?> get props => [];
}

