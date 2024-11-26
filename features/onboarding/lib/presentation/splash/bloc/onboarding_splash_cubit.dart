import 'dart:io';

import 'package:commons_core/app_info/app_info.dart';
import 'package:commons_core/result/result.dart';
import 'package:commons_security/domain/usecase/auth_find_credentials_usecase.dart';
import 'package:features_force_update/domain/usecase/force_update_check_version_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:features_onboarding/domain/usecase/onboarding_check_is_first_time_usecase.dart';
import 'package:features_onboarding/presentation/splash/bloc/onboarding_splash_state.dart';

@Injectable()
class OnboardingSplashCubit extends Cubit<OnboardingSplashState> {

  OnboardingSplashCubit(
      this._checkVersionUseCase,
      this._findCredentialsUseCase,
      this._checkIsFirstTimeUseCase
  ) : super(OnboardingSplashInitState());

  final AuthFindCredentialsUseCase _findCredentialsUseCase;
  final ForceUpdateCheckVersionUseCase _checkVersionUseCase;
  final OnboardingCheckIsFirstTimeUseCase _checkIsFirstTimeUseCase;

  Future<void> checkUpdateAndFindCredentials() async {
    await Future.delayed(const Duration(seconds: 3));

    // Check for force update
    final forceUpdateResult = await _checkVersionUseCase.invoke();
    if (_isSuccessAndResultTrue(forceUpdateResult)) {
      emit(OnboardingSplashForceUpdateState());
      return;
    }

    // Check for saved credentials
    final credentialsResult = await _findCredentialsUseCase.invoke();
    if (_isSuccessAndNotNull(credentialsResult)) {
      emit(OnboardingSplashUserRegisteredState());
      return;
    }

    // Check if it's the user's first access
    final firstTimeResult = await _checkIsFirstTimeUseCase.invoke();
    final bool isFirstAccess = _isSuccessAndResultTrue(firstTimeResult);
    emit(OnboardingSplashUserNotRegisteredState(isFirstAccess: isFirstAccess));
  }

  bool _isSuccessAndResultTrue(dynamic result) {
    return result is Success && result.data == true;
  }

  bool _isSuccessAndNotNull(dynamic result) {
    return result is Success && result.data != null;
  }

}