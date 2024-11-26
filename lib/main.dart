import 'package:appdoctorline/di/base_injection.dart';
import 'package:appdoctorline/firebase_options.dart';
import 'package:appdoctorline/start.dart';
import 'package:commons_crash_report/i_crash_reporter.dart';
import 'package:commons_remote_config/data/service/i_remote_config_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetIt.instance<IRemoteConfigService>().initialize();
  await GetIt.instance<ICrashReport>().initialize();
  runApp(StartWidget());
}
