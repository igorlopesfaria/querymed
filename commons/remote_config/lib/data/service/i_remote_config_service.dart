abstract class IRemoteConfigService {
  Future<void> initialize();
  String getString(String key);
  bool getBool(String key);
  int getInt(String key);
  double getDouble(String key);
}
