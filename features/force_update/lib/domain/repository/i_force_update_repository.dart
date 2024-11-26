import 'package:commons_core/result/result.dart';

abstract class IForceUpdateRepository {
  Future<Result<bool>> checkVersion(String platform, String versionCode);
}
