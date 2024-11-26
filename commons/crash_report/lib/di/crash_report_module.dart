import 'package:commons_crash_report/di/crash_report_module.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(initializerName: 'initCrashReportGetIt')
Future<void> configureCommonsCrashReportDependencies(GetIt getIt) async =>
    getIt.initCrashReportGetIt();