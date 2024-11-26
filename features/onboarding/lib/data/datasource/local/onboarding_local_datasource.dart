import 'package:commons_core/exceptions/data_exception.dart';
import 'package:commons_crash_report/i_crash_reporter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:features_onboarding/data/datasource/local/i_onboarding_local_datasource.dart';

@Injectable(as: IOnboardingLocalDataSource)
class OnboardingLocalDataSource implements IOnboardingLocalDataSource {
  final FlutterSecureStorage _secureStorage;
  final ICrashReport _reporter;

  static const onboardingIsFirstTime = "onboarding_is_first_time";

  OnboardingLocalDataSource(this._secureStorage, this._reporter);

  @override
  Future updateFirstTime(bool isFirstTime) async {
    try {
      await _secureStorage.write(key: onboardingIsFirstTime, value: isFirstTime.toString());
    } on Exception catch (exception, stacktrace) {
      _reporter.recordError(
          exception,
          stackTrace: stacktrace,
          reason: "Failed to insert onboarding_is_first_time data: ${exception.toString()}"
      );
      throw DataDBException();
    }
  }

  @override
  Future<bool> isFirstTime() async {
    try {
      final isFirstTime = await _secureStorage.read(key: onboardingIsFirstTime) ?? "true";
      return isFirstTime == "true";
    } on Exception catch (exception, stacktrace) {
      _reporter.recordError(
          exception,
          stackTrace: stacktrace,
          reason: "Failed to find onboarding_is_first_time data: ${exception.toString()}"
      );
      throw DataDBException();
    }
  }
}
