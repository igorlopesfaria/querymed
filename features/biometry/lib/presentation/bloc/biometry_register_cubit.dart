
import 'package:features_biometry/domain/usecase/insert_ask_biometry_usecase.dart';
import 'package:features_biometry/domain/usecase/insert_use_biometry_usecase.dart';
import 'package:features_biometry/presentation/bloc/biometry_register_state.dart';
import 'package:features_biometry/presentation/string/biometry_register_string.dart';
import 'package:commons_core/result/result.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

@Injectable()
class BiometryRegisterCubit extends Cubit<BiometryRegisterState> {

  BiometryRegisterCubit(
      this._insertUseBiometryUseCase,
  ) : super(BiometryRegisterInitState());

  final InsertUseBiometryUseCase _insertUseBiometryUseCase;
  final LocalAuthentication auth = LocalAuthentication();

  Future<void> authenticateOS() async {

    emit(BiometryRegisterLoadingState());
    try {
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: BiometryRegisterStrings.localizedReason
      );

      if (didAuthenticate == false) {
        emit(BiometryRegisterCancelState());
        return;
      }
      _registerBiometry();

    } on PlatformException catch (_) {
      emit(BiometryRegisterSnackErrorState(
          message: BiometryRegisterStrings.badBiometryOperation
      ));

    }
  }

  Future _registerBiometry() async {
    Result result = await _insertUseBiometryUseCase.invoke(true);
    if (result is Failure) {
      emit(BiometryRegisterSnackErrorState(
          message: BiometryRegisterStrings.badBiometryOperation
      ));
      return;
    }
    emit(BiometryRegisterSuccessState());
  }
  
}
