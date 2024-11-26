import 'dart:io';
import 'package:commons_crash_report/i_crash_reporter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:features_force_update/presentation/bloc/force_update_state.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

@Injectable()
class ForceUpdateCubit extends Cubit<ForceUpdateState> {

  ForceUpdateCubit(
      this._reporter
  ) : super(ForceUpdateInitState());

  final ICrashReport _reporter;

  void reportError(Exception exception, StackTrace stacktrace) {
  }

  void goToStore() {
    try {
      var uri = Uri.parse('https://apps.apple.com/');
      if (Platform.isAndroid) {
        uri = Uri.parse('https://play.google.com/');
      }

      launchUrl(uri, mode: LaunchMode.externalApplication);
    }  on Exception catch (exception, stacktrace) {
      _reporter.recordError(exception, stackTrace: stacktrace);
    }
  }

}