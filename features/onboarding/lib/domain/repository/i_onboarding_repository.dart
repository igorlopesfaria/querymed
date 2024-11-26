import 'package:commons_core/result/result.dart';

abstract class IOnboardingRepository{
  Future<Result<bool>> checkIsFirstTimeRunningOnboarding();
  Future<Result> updateFirstTimeRunningOnboarding(bool isFirstTimeRunningOnboarding);
}
