
import 'package:design_system_core/token/ds_tokens.dart';
import 'package:design_system_core/token/tokens_base.dart';

class DSTokenProvider {
  static DSTokenProvider? _instance;
  TokensBase _value = DSTokens();

  factory DSTokenProvider() {
    return _instance ??= DSTokenProvider._internal();
  }

  DSTokenProvider._internal() {
    _value = DSTokens();
  }

  void setDesignSystemToken() {
    _value = DSTokens();
  }

  TokensBase provide() => _value;
}

