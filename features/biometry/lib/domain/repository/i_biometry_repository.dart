import 'package:commons_core/result/result.dart';

abstract class IBiometryRepository {
  Future<Result> insertAskBiometryOnSignin(bool askAgainBiometry);
  Future<Result<bool>> findAskBiometryOnSignin();

  Future<Result> insertUseBiometryOnSignin(bool shouldUseBiometry);
  Future<Result<bool>> findUseBiometryOnSignin();

}
