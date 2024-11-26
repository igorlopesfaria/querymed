
abstract class IOnboardingLocalDataSource {
  Future updateFirstTime(bool isFirstTime);
  Future<bool> isFirstTime();
}