import 'package:commons_core/exceptions/business_exception.dart';
import 'package:commons_core/result/result.dart';
import 'package:commons_media_validation/domain/model/media_validation.dart';
import 'package:commons_media_validation/domain/usecase/media_validation_verify_code_usecase.dart';
import 'package:commons_validator/domain/usecase/validate_media_code.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.callback.dart';
import 'package:features_reset_password/presentation/forms/verify_code/bloc/reset_password_forms_verify_code_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ResetPasswordFormsVerifyCodeCubit extends Cubit<ResetPasswordFormsVerifyCodeState> {

 ResetPasswordFormsVerifyCodeCubit(this._verifyCodeUseCase, this._validateCodeUseCase)
     : super(ResetPasswordFormsVerifyCodeInitState());

  TextEditingController codeControllerText = TextEditingController(text: '');

  MediaValidationVerifyCodeUseCase _verifyCodeUseCase;
  ValidateMediaCodeUseCase _validateCodeUseCase;

  Future checkValidCode(String token) async {
    String code = codeControllerText.text;

    Result validate = await _validateCodeUseCase.invoke(code);
    if(validate is Failure){
      emit(ResetPasswordFormsVerifyCodeFieldErrorState(showText: false));
      return;
    }
    emit(ResetPasswordFormsVerifyCodeLoadingState());

    switch(await _verifyCodeUseCase.invoke(code, token)) {
      case (Success _) : {
        emit(ResetPasswordFormsVerifyCodeSuccessState());
      }
      case (Failure failure) when failure.exception is ConnectionException :{
        emit(ResetPasswordFormsVerifyCodeBannerErrorState(
            bottomSheetProps: getConnectionBannerErrorProps()
        ));
        return;
      }
      case (Failure failure) when failure.exception is NotMatchFieldException :{
        emit(ResetPasswordFormsVerifyCodeFieldErrorState(showText: true));
        return;
      }
      case (Failure _) : {
        emit(ResetPasswordFormsVerifyCodeBannerErrorState(
            bottomSheetProps: getGenericBannerErrorProps()
        ));
        return;

      }
    }

  }
}
