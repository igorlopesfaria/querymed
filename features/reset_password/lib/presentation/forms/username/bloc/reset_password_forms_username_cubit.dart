import 'package:commons_core/exceptions/business_exception.dart';
import 'package:commons_core/result/result.dart';
import 'package:commons_media_validation/domain/usecase/media_validation_get_token_usecase.dart';
import 'package:commons_validator/domain/usecase/validate_crm_usecase.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.callback.dart';
import 'package:features_address/domain/model/address_state.dart';
import 'package:features_reset_password/presentation/forms/username/bloc/reset_password_forms_username_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ResetPasswordFormsUsernameCubit extends Cubit<ResetPasswordFormsUsernameState> {

  ResetPasswordFormsUsernameCubit(
      this._validateCrmUseCase,
      this._getTokenUseCase
  ) : super(ResetPasswordFormsUsernameInitState());

  final ValidateCrmUseCase _validateCrmUseCase;
  final MediaValidationGetTokenUseCase _getTokenUseCase;
  TextEditingController crmNumberControllerText = TextEditingController(text: '');
  AddressState? addressStateSelected;

  Future checkCrmFormat() async {
    final stateCode = addressStateSelected?.stateCode;
    if (stateCode == null) {
      return;
    }
    final crmNumber = "${crmNumberControllerText.text}/$stateCode";
    if (await _validateCrmUseCase.invoke(crmNumber, false) is Success) {
      emit(ResetPasswordFormsUsernameValidState());
    }
  }

  Future getToken() async {
    emit(ResetPasswordFormsUsernameLoadingState());
    String crmNumber = crmNumberControllerText.text;
    final result = await _getTokenUseCase.invoke(crmNumber, "email");

    switch (result) {
      case (Success success) : {
        emit(ResetPasswordFormsUsernameSuccessState(success.data));
      }
      case (Failure failure) when failure.exception is ConnectionException: {
        emit(ResetPasswordFormsUsernameBannerErrorState(
            bottomSheetProps: getConnectionBannerErrorProps()
        ));
      }
      case (_) :{
        emit(ResetPasswordFormsUsernameBannerErrorState(
            bottomSheetProps: getGenericBannerErrorProps()
        ));
      }

    }
  }
}

