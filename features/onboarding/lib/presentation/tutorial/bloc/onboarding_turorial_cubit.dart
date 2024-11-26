import 'dart:async';

import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:features_onboarding/domain/usecase/onboarding_check_update_first_time_usecase.dart';
import 'package:features_onboarding/presentation/tutorial/string/onboarding_tutorial_string.dart';
import 'package:features_onboarding/presentation/tutorial/bloc/onboarding_tutorial_state.dart';

@Injectable()
class OnboardingTutorialCubit extends Cubit<OnboardingTutorialState> {

  OnboardingTutorialCubit(
      this._updateFirstTimeUseCase,
      ) : super(OnboardingTutorialInitState());

  final OnboardingCheckUpdateFirstTimeUseCase _updateFirstTimeUseCase;
  late List<String> images = List.empty();
  late List<String> titles = List.empty();
  late List<String> descriptions = List.empty();
  final int totalPage = 3;

  Future initValues() async {
    final token = DSTokenProvider().provide();

    images = [
      token.assets.imTutorial1,
      token.assets.imTutorial2,
      token.assets.imTutorial3
    ];

    titles = [
      OnboardingTutorialStrings.title1,
      OnboardingTutorialStrings.title2,
      OnboardingTutorialStrings.title3
    ];

    descriptions = [
      OnboardingTutorialStrings.description1,
      OnboardingTutorialStrings.description2,
      OnboardingTutorialStrings.description3
    ];
  }

  Future finishTutorial() async {
    emit(OnboardingTutorialLoadingState());
    _updateFirstTimeUseCase.invoke(false);
    emit(OnboardingTutorialFinished());
  }

}