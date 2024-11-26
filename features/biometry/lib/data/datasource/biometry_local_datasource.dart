import 'package:features_biometry/data/datasource/i_biometry_local_datasource.dart';
import 'package:commons_core/exceptions/data_exception.dart';
import 'package:commons_core/extensions/string.dart';
import 'package:commons_crash_report/i_crash_reporter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: IBiometryLocalDataSource)
class BiometryLocalDataSource implements IBiometryLocalDataSource {
  final FlutterSecureStorage _secureStorage;
  final ICrashReport _reporter;

  static const askBiometryOnSignin = "askBiometryOnSignin";
  static const useBiometryOnSignin = "useBiometryOnSignin";

  BiometryLocalDataSource(this._secureStorage, this._reporter);

  @override
  Future insertAskBiometryOnSignin(bool askAgainBiometry) async {
    try {
      await _secureStorage.write(
          key: askBiometryOnSignin,
          value:  askAgainBiometry.toString()
      );
    }  on Exception catch (exception, stacktrace) {
      _reporter.recordError(
          exception,
          stackTrace: stacktrace,
          reason: "Failed to insert ask biometry on local datasource: ${exception.toString()}"
      );
      throw DataDBException();
    }
  }

  @override
  Future<bool> findAskBiometryOnSignin() async {
    try {
      final data = await _secureStorage.read(key: askBiometryOnSignin);
      return (data != null && data.isNotEmpty) ? data.parseBool() : true;
    } on Exception catch (exception, stacktrace) {
      _reporter.recordError(
        exception,
        stackTrace: stacktrace,
        reason: "Failed to retrieve ask biometry from local datasource: ${exception.toString()}",
      );
      throw DataDBException();
    }
  }

  @override
  Future insertUseBiometryOnSignin(bool useBiometry) async {
    try {
      await _secureStorage.write(
          key: useBiometryOnSignin,
          value:  useBiometry.toString()
      );
    } on Exception catch (exception, stacktrace) {
      _reporter.recordError(
        exception,
        stackTrace: stacktrace,
        reason: "Failed to retrieve use biometry from local datasource: ${exception.toString()}",
      );
      throw DataDBException();
    }
  }

  @override
  Future<bool> findUseBiometryOnSignin() async {
    try {
      final data = await _secureStorage.read(key: useBiometryOnSignin);
      return (data != null && data.isNotEmpty) ? data.parseBool() : true;
    } on Exception catch (exception, stacktrace) {
      _reporter.recordError(
        exception,
        stackTrace: stacktrace,
        reason: "Failed to retrieve use biometry from local datasource: ${exception.toString()}",
      );
      throw DataDBException();
    }
  }

}
