import 'package:commons_core/result/result.dart';
import 'package:features_onboarding/data/datasource/local/i_onboarding_local_datasource.dart';
import 'package:features_onboarding/domain/repository/i_onboarding_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IOnboardingRepository)
class OnboardingRepository implements IOnboardingRepository{
  final IOnboardingLocalDataSource _localDataSource;

  OnboardingRepository(this._localDataSource);

  @override
  Future<Result<bool>> checkIsFirstTimeRunningOnboarding() async{
    try {
      bool isFirstTime = await _localDataSource.isFirstTime();
      return Success(data: isFirstTime);
    } catch (exception) {
      return Failure();
    }
  }

  @override
  Future<Result> updateFirstTimeRunningOnboarding(bool isFirstTimeRunningOnboarding) async {
    try {
      await _localDataSource.updateFirstTime(isFirstTimeRunningOnboarding);
      return Success();
    } catch (exception) {
      return Failure();
    }
  }
}