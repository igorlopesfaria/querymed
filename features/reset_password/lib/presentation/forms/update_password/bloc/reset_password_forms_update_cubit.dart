import 'package:commons_core/exceptions/business_exception.dart';
import 'package:commons_core/result/result.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.callback.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.dart';
import 'package:equatable/equatable.dart';
import 'package:features_reset_password/domain/usecase/update_password_usecase.dart';
import 'package:commons_validator/domain/usecase/validate_password_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'reset_password_forms_update_state.dart';

@Injectable()
class ResetPasswordFormsUpdateCubit extends Cubit<ResetPasswordFormsUpdateState> {
  ResetPasswordFormsUpdateCubit(this._updatePasswordUseCase, this._validatePasswordUseCase)
      : super(ResetPasswordFormsUpdateInitState());

  final UpdatePasswordUseCase _updatePasswordUseCase;
  final ValidatePasswordUseCase _validatePasswordUseCase;
  TextEditingController passwordControllerText = TextEditingController(text: '');



  Future<void> checkPasswordFormat() async {
    final result = await _validatePasswordUseCase.invoke(passwordControllerText.text);
    if (result is Failure) {
      emit(ResetPasswordFormsUpdateFieldErrorState(showText: true));
      return;
    }
    emit(ResetPasswordFormsUpdateValidState());
  }

  Future<void> updatePassword(String token) async {
    emit(ResetPasswordFormsUpdateLoadingState());
    final result = await _updatePasswordUseCase.invoke(passwordControllerText.text, token);

    switch (result) {
      case Success _:
        emit(ResetPasswordUpdateSuccessState());
        break;
      case Failure failure when failure.exception is ConnectionException:
        emit(ResetPasswordFormsUpdateBannerErrorState(
            bottomSheetProps: getConnectionBannerErrorProps()
        ));
        break;
      case Failure failure when failure.exception is InvalidFieldException:
        emit(ResetPasswordFormsUpdateFieldErrorState(showText: true));
        break;
      case Failure _:
        emit(ResetPasswordFormsUpdateBannerErrorState(
            bottomSheetProps: getGenericBannerErrorProps()
        ));
        break;
    }
  }
}