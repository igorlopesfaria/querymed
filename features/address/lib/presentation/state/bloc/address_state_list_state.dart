import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.dart';
import 'package:equatable/equatable.dart';
import 'package:features_address/domain/model/address_state.dart';
import 'package:features_address/presentation/state/uimodel/address_state_ui_model.dart';

abstract class AddressStateListState extends Equatable {}

class AddressStateInitState extends AddressStateListState {
  @override
  List<Object?> get props => [];
}

class AddressStateListLoadingState extends AddressStateListState {
  @override
  List<Object?> get props => [];
}

class AddressStateListSuccessState extends AddressStateListState {
  AddressStateListSuccessState({required this.addressStateList});
  final List<AddressStateUiModel> addressStateList;
  @override
  List<Object?> get props => [addressStateList];
}

class AddressStateListInternetErrorState extends AddressStateListState {

  AddressStateListInternetErrorState();

  @override
  List<Object?> get props => [];
}

class AddressStateListGenericErrorState extends AddressStateListState {

  AddressStateListGenericErrorState();

  @override
  List<Object?> get props => [];
}


class AddressStateListEmptyState extends AddressStateListState {
  @override
  List<Object?> get props => [];
}
