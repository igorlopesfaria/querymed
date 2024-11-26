import 'package:commons_security/data/dto/db/auth_local_db.dart';

abstract class IAuthLocalDataSource {
  Future insert(AuthLocalDB authLocalDB);
  Future<AuthLocalDB?> find();
  Future<String?> findAuthToken();
  Future delete();
}