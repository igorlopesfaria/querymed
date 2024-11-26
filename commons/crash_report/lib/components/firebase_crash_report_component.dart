import 'package:commons_crash_report/components/i_crash_report_component.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';


@Injectable()
class FirebaseCrashReportComponent extends ICrashReportComponent {
  final FirebaseCrashlytics _crashlyticsFirebase;

  FirebaseCrashReportComponent() : _crashlyticsFirebase = FirebaseCrashlytics.instance;

  @override
  Future<void> initialize() async {}

  @override
  void onFlutterOnError(errorDetails) {
    _crashlyticsFirebase.recordFlutterFatalError(errorDetails);
  }

  @override
  void onPlatformDispatcherOnError(error, stack) {
    _crashlyticsFirebase.recordError(error, stack, fatal: true);
  }

  @override
  void recordError(Exception exception,{StackTrace? stackTrace, String? reason, Map<String, Object>? customInfo}) {
    customInfo?.forEach((key, value) {
      _crashlyticsFirebase.setCustomKey(key, value);
    });
    _crashlyticsFirebase.recordError(exception, stackTrace, reason: reason);
  }

  @override
  void setUserIdentifier(String identifier) {
    _crashlyticsFirebase.setUserIdentifier(identifier);
  }
}
