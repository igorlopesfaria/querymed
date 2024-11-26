import 'package:commons_security/domain/model/auth.dart';

abstract class IAuthProvider {
  void setLoggedUser(Auth? auth);
  bool isAuthenticated();
  Auth? provide();
}