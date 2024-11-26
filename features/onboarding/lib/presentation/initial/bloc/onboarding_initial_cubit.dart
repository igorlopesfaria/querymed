import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:features_onboarding/presentation/initial/bloc/onboarding_initial_state.dart';

@Injectable()
class OnboardingInitialCubit extends Cubit<OnboardingInitialState> {

  OnboardingInitialCubit() : super(OnboardingInitialInitState());

}