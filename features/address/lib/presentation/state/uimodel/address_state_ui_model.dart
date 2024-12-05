import 'package:equatable/equatable.dart';
import 'package:features_address/domain/model/address_state.dart';

class AddressStateUiModel extends Equatable {

  AddressStateUiModel({
    required this.stateName,
    required this.stateCode,
    required this.flagImagePath,
    this.isSelected = false
  });

  final String stateName;
  final String stateCode;
  final String flagImagePath;
  bool isSelected;

  @override
  List<Object> get props => [stateName, stateCode, flagImagePath, isSelected];
}

extension AddressStateMapper on AddressState {
  AddressStateUiModel get mapToUiModel {
    return AddressStateUiModel(
        stateName: stateName,
        stateCode: stateCode,
        flagImagePath: flagImagePath
    );
  }
}

extension AddressStateUiMapper on AddressStateUiModel {
  AddressState get mapToModel {
    return AddressState(
        stateName: stateName,
        stateCode: stateCode,
        flagImagePath: flagImagePath
    );
  }
}

