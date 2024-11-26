import 'package:commons_core/exceptions/business_exception.dart';
import 'package:commons_core/result/result.dart';
import 'package:commons_crash_report/i_crash_reporter.dart';
import 'package:commons_security/domain/model/auth.dart';
import 'package:commons_security/domain/usecase/auth_find_credentials_usecase.dart';
import 'package:commons_security/domain/usecase/auth_refresh_token_usecase.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.callback.dart';
import 'package:features_login/presentation/biometry/bloc/login_biometry_state.dart';
import 'package:features_login/presentation/biometry/string/login_biometry_string.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

@Injectable()
class LoginBiometryCubit extends Cubit<LoginBiometryState> {

  LoginBiometryCubit(
    this._authFindCredentialsUseCase,
    this._authRefreshTokenUseCase,
    this._reporter
  ) : super(LoginBiometryInitState());

  final AuthFindCredentialsUseCase _authFindCredentialsUseCase;
  final AuthRefreshTokenUseCase _authRefreshTokenUseCase;
  final ICrashReport _reporter;
  final LocalAuthentication auth = LocalAuthentication();


  Future<void> authenticateOS() async {

      emit(LoginBiometryLoadingState());
      try {
        final bool didAuthenticate = await auth.authenticate(
            localizedReason: LoginBiometryStrings.localizedReason);

        if (didAuthenticate == false) {
          emit(LoginBiometryCancelState());
          return;
        }
        _biometryAuthentication();

      } on PlatformException catch (_) {
        emit(LoginBiometrySnackErrorState(
            messageError: LoginBiometryStrings.badBiometryOperation
        ));
      }
  }

  Future _biometryAuthentication() async {
    Auth? auth = switch (await _authFindCredentialsUseCase.invoke()) {
        (Success success) => success.data,
        (_) => null
      };

    if (auth == null) {
      emit(LoginBiometryBannerErrorState(
          bottomSheetProps: getGenericBannerErrorProps()
      ));
      return;
    } else {
      _reporter.setUserIdentifier(auth.id);
    }

    switch (await _authRefreshTokenUseCase.invoke(auth.token.stRefreshToken)) {
      case (Failure failure) when failure.exception is ConnectionException:
        emit(LoginBiometryBannerErrorState(
          bottomSheetProps: getConnectionBannerErrorProps()
        ));
        return;
      case (Failure _):
        emit(LoginBiometryBannerErrorState(
          bottomSheetProps: getGenericBannerErrorProps()
        ));
        return;
    }
  }
}
