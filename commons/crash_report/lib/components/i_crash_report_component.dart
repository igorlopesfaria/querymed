abstract class ICrashReportComponent{
  Future<void> initialize();
  void onFlutterOnError(errorDetails);
  void onPlatformDispatcherOnError(error, stack);
  void recordError(Exception exception, {StackTrace? stackTrace, String? reason, Map<String, Object>? customInfo});
  void setUserIdentifier(String identifier);
}
