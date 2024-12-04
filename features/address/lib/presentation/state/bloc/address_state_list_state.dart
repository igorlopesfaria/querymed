import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.dart';
import 'package:equatable/equatable.dart';
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
class AddressStateListBannerErrorState extends AddressStateListState {

  AddressStateListBannerErrorState({required this.bottomSheetProps});

  final DSFeedbackBottomSheetProps bottomSheetProps;

  @override
  List<Object?> get props => [bottomSheetProps];
}


class AddressStateListErrorState extends AddressStateListState {
  @override
  List<Object?> get props => [];
}
