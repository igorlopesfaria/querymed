import 'package:equatable/equatable.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<AppInfo> fetchAppInfo() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return AppInfo(
      packageName:packageInfo.packageName,
      versionName: packageInfo.version,
      versionCode: packageInfo.buildNumber,
  );
}

class AppInfo extends Equatable {
  const AppInfo({ required this.packageName, required this.versionName, required this.versionCode});

  final String packageName;
  final String versionName;
  final String versionCode;

  @override
  List<Object> get props => [packageName, versionName, versionCode];
}
