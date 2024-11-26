import 'package:commons_core/result/result.dart';
import 'package:injectable/injectable.dart';
import 'package:features_onboarding/domain/repository/i_onboarding_repository.dart';

@Injectable()
class OnboardingCheckUpdateFirstTimeUseCase{
  final IOnboardingRepository _repository;

  OnboardingCheckUpdateFirstTimeUseCase(this._repository);

  Future<Result<void>> invoke(bool isFirstTime) async =>
      await _repository.updateFirstTimeRunningOnboarding(isFirstTime);
}