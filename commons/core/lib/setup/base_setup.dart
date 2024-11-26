import 'package:commons_core/setup/environment.dart';

class BaseSetup {
  static Environment env = Environment.values.byName(
      const String.fromEnvironment('ENVIRONMENT')
  );
}
