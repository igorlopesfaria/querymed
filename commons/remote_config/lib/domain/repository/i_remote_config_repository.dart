abstract class IRemoteConfigRepository {
  String getString(String key);
  bool getBool(String key);
  int getInt(String key);
  double getDouble(String key);
}