import 'package:commons_security/domain/model/auth.dart';
import 'package:commons_security/provider/i_auth_provider.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IAuthProvider)
class AuthProvider extends IAuthProvider {

  Auth? _value;

  @override
  void setLoggedUser(Auth? auth) {
    _value = auth;
  }

  @override
  bool isAuthenticated() => _value != null;

  @override
  Auth? provide() => _value;
}
