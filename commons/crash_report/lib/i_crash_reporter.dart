abstract class ICrashReport {
  Future<void> initialize();

  Future<void> recordError(Exception exception, {StackTrace? stackTrace,
    String? reason, Map<String, Object>? customInfo});

  void setUserIdentifier(String identifier);
}
