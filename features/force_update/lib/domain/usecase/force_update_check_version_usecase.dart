import 'dart:io';

import 'package:commons_core/app_info/app_info.dart';
import 'package:commons_core/result/result.dart';
import 'package:features_force_update/domain/repository/i_force_update_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ForceUpdateCheckVersionUseCase{
  final IForceUpdateRepository _repository;

  ForceUpdateCheckVersionUseCase(this._repository);

  Future<Result<bool>> invoke() async {
    final String platform = Platform.operatingSystem;
    final AppInfo appInfo = await fetchAppInfo();

    return await _repository.checkVersion(platform, appInfo.versionCode);
  }
}