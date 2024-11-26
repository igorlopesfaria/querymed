import 'package:commons_remote_config/data/service/i_remote_config_service.dart';
import 'package:injectable/injectable.dart';

import 'package:commons_remote_config/domain/repository/i_remote_config_repository.dart';

@Injectable(as: IRemoteConfigRepository)
class RemoteConfigRepository implements IRemoteConfigRepository {
  final IRemoteConfigService service;

  RemoteConfigRepository(this.service);

  @override
  String getString(String key) => service.getString(key);

  @override
  bool getBool(String key) => service.getBool(key);

  @override
  int getInt(String key) => service.getInt(key);

  @override
  double getDouble(String key) => service.getDouble(key);

}
