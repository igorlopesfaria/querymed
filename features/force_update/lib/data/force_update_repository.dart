import 'package:commons_core/result/result.dart';
import 'package:injectable/injectable.dart';
import 'package:features_force_update/data/datasource/api/i_force_update_api_datasource.dart';
import 'package:features_force_update/domain/repository/i_force_update_repository.dart';

@Injectable(as: IForceUpdateRepository)
class ForceUpdateRepository implements IForceUpdateRepository{
  final IForceUpdateApiDataSource _apiDataSource;

  ForceUpdateRepository(this._apiDataSource);

  @override
  Future<Result<bool>> checkVersion(String platform, String versionCode) async {
    try {
      final checkVersionApiResponse = await _apiDataSource.checkForceUpdate(platform, versionCode);
      return Success(data: checkVersionApiResponse.forceUpdate);
    } catch (exception) {
      return Failure();
    }
  }
}