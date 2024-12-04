import 'package:equatable/equatable.dart';

class AddressState extends Equatable {
  const AddressState({
    required this.stateName,
    required this.stateCode,
    required this.flagImagePath
  });

  final String stateName;
  final String stateCode;
  final String flagImagePath;

  @override
  List<Object> get props => [stateName, stateCode, flagImagePath];
}