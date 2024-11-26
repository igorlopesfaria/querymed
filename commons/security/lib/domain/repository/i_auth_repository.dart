import 'package:commons_core/result/result.dart';
import 'package:commons_security/domain/model/auth.dart';

abstract class IAuthRepository {
  Future<Result> delete();
  Future<Result<Auth>> find();
  Future<Result> save(Auth auth);
  Future<Result<Auth>> signin(String username, String password);
  Future<Result<Auth>> refreshToken(String refreshToken);

}
