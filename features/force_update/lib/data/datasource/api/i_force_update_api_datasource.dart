import 'package:features_force_update/data/dto/response/force_update_check_version_api_response.dart';


abstract class IForceUpdateApiDataSource{
  Future<ForceUpdateCheckVersionApiResponse> checkForceUpdate(String platform, String versionCode);
}

