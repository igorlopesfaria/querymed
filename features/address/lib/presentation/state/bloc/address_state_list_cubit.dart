
import 'package:commons_core/exceptions/business_exception.dart';
import 'package:commons_core/result/result.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.callback.dart';
import 'package:features_address/domain/model/address_state.dart';
import 'package:features_address/domain/usecase/get_address_state_usecase.dart';
import 'package:features_address/presentation/state/bloc/address_state_list_state.dart';
import 'package:features_address/presentation/state/uimodel/address_state_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AddressStateListCubit extends Cubit<AddressStateListState> {
  
  AddressStateListCubit(this._useCase) : super(AddressStateInitState());


  TextEditingController searchControllerText = TextEditingController(text: '');
  List<AddressState> addressStateList = [];
  final GetAddressStateUseCase _useCase;
  
  Future fillAddressStateInit() async {
    emit(AddressStateListLoadingState());
    Result<List<AddressState>> result = await _useCase.invoke();
    switch (result) {
      case (Success success) : {
        addressStateList = success.data;
        List<AddressStateUiModel> addressStateListUiModel  = addressStateList.map(
                (item) => item.mapToUiModel
        ).toList();
        emit(AddressStateListSuccessState(addressStateList:addressStateListUiModel));
        return;
      }
      case (Failure failure) when failure.exception is ConnectionException :
        emit(AddressStateListBannerErrorState(
            bottomSheetProps: getConnectionBannerErrorProps()));
        return;
      case (Failure _) :
        emit(AddressStateListBannerErrorState(
            bottomSheetProps: getGenericBannerErrorProps()
        ));
        return;
    }


  }

  Future filterAddressStateByText() async {
    String text = searchControllerText.text;
    emit(AddressStateListLoadingState());
    List<AddressStateUiModel> listFiltered = addressStateList.where(
            (item) => item.stateName.toLowerCase().contains(text.toLowerCase()) || item.stateCode.toString().contains(text))
        .map((item) => item.mapToUiModel)
        .toList();
    if (listFiltered.isNotEmpty) {
      emit(AddressStateListSuccessState(addressStateList: listFiltered));
    } else {
      emit(AddressStateListErrorState());
    }
  }
  
}