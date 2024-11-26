// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:commons_crash_report/components/firebase_crash_report_component.dart'
    as _i572;
import 'package:commons_crash_report/crash_reporter.dart' as _i997;
import 'package:commons_crash_report/i_crash_reporter.dart' as _i978;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initCrashReportGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i572.FirebaseCrashReportComponent>(
        () => _i572.FirebaseCrashReportComponent());
    gh.factory<_i978.ICrashReport>(() => _i997.CrashReport());
    return this;
  }
}
