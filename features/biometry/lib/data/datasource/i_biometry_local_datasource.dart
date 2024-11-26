abstract class IBiometryLocalDataSource {
  Future insertAskBiometryOnSignin(bool askAgainBiometry);
  Future<bool> findAskBiometryOnSignin();

  Future insertUseBiometryOnSignin(bool shouldUseBiometry);
  Future<bool> findUseBiometryOnSignin();
}
