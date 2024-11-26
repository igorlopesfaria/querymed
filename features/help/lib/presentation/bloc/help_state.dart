import 'package:features_help/domain/model/help_contact.dart';
import 'package:equatable/equatable.dart';

abstract class HelpState extends Equatable {}

class HelpInitState extends HelpState {
  @override
  List<Object?> get props => [];
}

class HelpLoadingState extends HelpState {
  @override
  List<Object?> get props => [];
}

class HelpSuccessState extends HelpState {
  HelpSuccessState({required this.contact});

  final HelpContact contact;

  @override
  List<Object?> get props => [contact];
}

class HelpErrorState extends HelpState {
  @override
  List<Object?> get props => [];
}
