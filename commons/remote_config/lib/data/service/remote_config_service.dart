import 'package:commons_remote_config/data/key/remote_config_key.dart';
import 'package:commons_remote_config/data/service/i_remote_config_service.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: IRemoteConfigService)
class RemoteConfigService implements IRemoteConfigService {
  RemoteConfigService() : _remoteConfig = FirebaseRemoteConfig.instance;
  final FirebaseRemoteConfig _remoteConfig;

  @override
  Future<void> initialize() async {
    await _setConfigSettings();
    await _setDefaults();
    await _fetchAndActivate();
  }

  Future<void> _setConfigSettings() async => _remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: kDebugMode ? 0 : 12),
    ),
  );

  Future<void> _setDefaults() async => _remoteConfig.setDefaults(
    {
      RemoteConfigKeys.helpWhatsappNumber: '+11976800990',
      RemoteConfigKeys.helpWhatsappNumberFormatted: '(11) 97680-0990',
      RemoteConfigKeys.helpEmail: 'meajuda@doctorline.com.br',

    },
  );

  Future<void> _fetchAndActivate() async {
    await _remoteConfig.fetchAndActivate();
  }

  @override
  String getString(String key) => _remoteConfig.getString(key);

  @override
  bool getBool(String key) => _remoteConfig.getBool(key);

  @override
  int getInt(String key) => _remoteConfig.getInt(key);

  @override
  double getDouble(String key) => _remoteConfig.getDouble(key);

}
