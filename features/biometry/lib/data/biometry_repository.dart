import 'package:features_biometry/data/datasource/biometry_local_datasource.dart';
import 'package:features_biometry/domain/repository/i_biometry_repository.dart';
import 'package:commons_core/result/result.dart';
import 'package:injectable/injectable.dart';

import 'datasource/i_biometry_local_datasource.dart';


@Injectable(as: IBiometryRepository)
class BiometryRepository implements IBiometryRepository {
  final IBiometryLocalDataSource _biometryLocal;

  BiometryRepository(this._biometryLocal);

  @override
  Future<Result<bool>> findAskBiometryOnSignin() async {
    try {
      final shouldAskBiometry = await _biometryLocal.findAskBiometryOnSignin();
      return Success(data: shouldAskBiometry);
    } catch (e) {
      return Failure();
    }
  }

  @override
  Future<Result<bool>> findUseBiometryOnSignin() async {
    try {
      final shouldUseBiometry = await _biometryLocal.findUseBiometryOnSignin();
      return Success(data: shouldUseBiometry);
    } catch (e) {
      return Failure();
    }
  }

  @override
  Future<Result> insertAskBiometryOnSignin(bool askAgainBiometry) async {
    try {
      await _biometryLocal.insertAskBiometryOnSignin(askAgainBiometry);
      return Success();
    } catch (e) {
      return Failure();
    }
  }

  @override
  Future<Result> insertUseBiometryOnSignin(bool shouldUseBiometry) async {
    try {
      await _biometryLocal.insertUseBiometryOnSignin(shouldUseBiometry);
      return Success();
    } catch (e) {
      return Failure();
    }

  }

}