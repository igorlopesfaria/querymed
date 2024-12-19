import 'package:features_reset_password/presentation/forms/verify_code/bloc/reset_password_forms_verify_code_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ResetPasswordFormsVerifyCodeCubit extends Cubit<ResetPasswordFormsVerifyCodeState> {

 ResetPasswordFormsVerifyCodeCubit() : super(ResetPasswordFormsVerifyCodeInitState());

  TextEditingController codeControllerText = TextEditingController(text: '');

  Future checkCode() async {
    if(codeControllerText.text.length < 6) {
      emit(ResetPasswordFormsVerifyCodeFieldErrorState());
      return;
    }
    emit(ResetPasswordFormsVerifyCodeValidState());
  }
}