import 'package:commons_core/exceptions/business_exception.dart';
import 'package:commons_core/result/result.dart';
import 'package:commons_core/strings/common_string.dart';
import 'package:commons_crash_report/i_crash_reporter.dart';
import 'package:commons_navigation/route/common_routes.dart';
import 'package:commons_security/domain/model/auth.dart';
import 'package:commons_security/domain/usecase/auth_usecase.dart';
import 'package:commons_validator/domain/usecase/validate_email_usecase.dart';
import 'package:commons_validator/domain/usecase/validate_password_usecase.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.callback.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:features_biometry/domain/usecase/find_ask_biometry_usecase.dart';
import 'package:features_login/presentation/default/string/login_default_string.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'login_default_state.dart';

@Injectable()
class LoginDefaultCubit extends Cubit<LoginDefaultState> {
  LoginDefaultCubit(
    this._authUseCase,
    this._findAskBiometryUseCase,
    this._validateEmailUseCase,
    this._validatePasswordUseCase,
    this._reporter,
  ) : super(LoginInitState());

  final AuthUseCase _authUseCase;
  final FindAskBiometryUseCase _findAskBiometryUseCase;
  final ValidateEmailUseCase _validateEmailUseCase;
  final ValidatePasswordUseCase _validatePasswordUseCase;
  final ICrashReport _reporter;

  TextEditingController controllerTextEmail = TextEditingController(text: '');
  TextEditingController controllerTextPassword = TextEditingController(text: '');
  String password = "";
  String email = "";

  Future authentication() async {
    emit(LoginDefaultLoadingState());
    String? messageErrorCpf = switch (await _validateEmailUseCase.invoke(controllerTextEmail.text, false)) {
      (Failure failure) when failure.exception is EmptyFieldException => CommonString.emptyField,
      (Failure failure) when failure.exception is InvalidFieldException => LoginDefaultStrings.invalidEmail,
      (_) => null
    };

    String? messageErrorPassword = switch (await _validatePasswordUseCase.invoke(controllerTextPassword.text)) {
      (Failure failure) when failure.exception is EmptyFieldException => CommonString.emptyField,
      (Failure failure) when failure.exception is InvalidFieldException => LoginDefaultStrings.invalidPassword,
      (_) => null
    };

    if (messageErrorCpf != null || messageErrorPassword != null) {
      emit(LoginDefaultFieldErrorState(
          messageErrorEmail: messageErrorCpf,
          messageErrorPassword: messageErrorPassword));
      return;
    }

    Result<Auth> resultAuth = await _authUseCase.invoke(
        controllerTextEmail.text,
        controllerTextPassword.text
    );
    Auth? auth;
    switch (resultAuth) {
      case (Success success) : {
        auth = success.data;
      }
      case (Failure failure) when failure.exception is ConnectionException :
        emit(LoginDefaultBannerErrorState(
            bottomSheetProps: getConnectionBannerErrorProps()));
        return;
      case (Failure failure) when failure.exception is BadCredentialsException :
        emit(LoginDefaultSnackErrorState(
            messageError: LoginDefaultStrings.badCredentialsMessage));
        return;
      case (Failure _) :
        emit(LoginDefaultBannerErrorState(
            bottomSheetProps: getGenericBannerErrorProps()
        ));
        return;
    }

    if(auth == null) {
      emit(LoginDefaultBannerErrorState(
          bottomSheetProps: getGenericBannerErrorProps()
      ));
    }
    _reporter.setUserIdentifier(auth!.id);

    final resultAsk = await _findAskBiometryUseCase.invoke();
    String route = CommonRoutes.homeRoute;
    if(resultAsk is Success && resultAsk.data == true && await checkHasBiometrySensorsOnDevice()) {
      route = CommonRoutes.biometryRegisterRoute;
    }
    emit(LoginDefaultSuccessState(route: route));
  }

  Future<bool> checkHasBiometrySensorsOnDevice() async {
    try {
      return await LocalAuthentication().isDeviceSupported();
    } on PlatformException catch (_) {
      return false;
    }
  }

}
