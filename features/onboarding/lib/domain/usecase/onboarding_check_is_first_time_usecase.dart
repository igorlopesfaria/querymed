import 'package:commons_core/result/result.dart';
import 'package:injectable/injectable.dart';
import 'package:features_onboarding/domain/repository/i_onboarding_repository.dart';

@Injectable()
class OnboardingCheckIsFirstTimeUseCase{
  final IOnboardingRepository _repository;

  OnboardingCheckIsFirstTimeUseCase(this._repository);

  Future<Result<bool>> invoke() async => (
      await _repository.checkIsFirstTimeRunningOnboarding()
  );
}