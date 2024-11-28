import 'package:commons_core/exceptions/data_exception.dart';
import 'package:commons_crash_report/components/firebase_crash_report_component.dart';
import 'package:commons_crash_report/components/i_crash_report_component.dart';
import 'package:commons_crash_report/i_crash_reporter.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ICrashReport)
class CrashReport implements ICrashReport {

  final List<ICrashReportComponent> components = [
    GetIt.instance<FirebaseCrashReportComponent>(),
  ];

  @override
  Future<void> initialize() async {
    for (var component in components) {
      await component.initialize();
      configureOnErrors(component);
    }
  }

  void configureOnErrors(ICrashReportComponent element) {
    FlutterError.onError = (errorDetails) {
      element.onFlutterOnError(errorDetails);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      element.onPlatformDispatcherOnError(error, stack);
      return true;
    };
  }

  @override
  Future<void> recordError(Exception exception, {StackTrace? stackTrace,
      String? reason, Map<String, Object>? customInfo}) async {
    if(exception is! DataApiInternetConnectionException || exception is! DataApiSeverForbiddenException) {
      for (var element in components) {
        element.recordError(
            exception,
            stackTrace: stackTrace,
            reason: reason,
            customInfo: customInfo
        );
      }
    }
  }

  @override
  void setUserIdentifier(String identifier) {
    for (var element in components) {
      element.setUserIdentifier(identifier);
    }
  }
}
