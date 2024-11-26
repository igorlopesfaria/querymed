
import 'package:commons_core/result/result.dart';
import 'package:commons_security/domain/model/auth.dart';
import 'package:commons_security/domain/repository/i_auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AuthUseCase {
  final IAuthRepository repositoryAuth;

  AuthUseCase(this.repositoryAuth);

  Future<Result<Auth>> invoke(String username, String password) async {
    final resultAuth = await repositoryAuth.signin(username, password);

    if (resultAuth is Success<Auth> && resultAuth.data != null) {

      await repositoryAuth.save(resultAuth as Auth);
    }

    return resultAuth;
  }
}
