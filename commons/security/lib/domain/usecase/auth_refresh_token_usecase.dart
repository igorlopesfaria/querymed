import 'package:commons_core/result/result.dart';
import 'package:injectable/injectable.dart';
import '../model/auth.dart';
import '../repository/i_auth_repository.dart';

@Injectable()
class AuthRefreshTokenUseCase {
  final IAuthRepository repositoryAuth;

  AuthRefreshTokenUseCase(this.repositoryAuth);

  Future<Result<Auth>> invoke(String stRefreshToken) async {
    final resultRefresh = await repositoryAuth.refreshToken(stRefreshToken);

    if (resultRefresh is Success<Auth> && resultRefresh.data != null) {
      await repositoryAuth.save(resultRefresh.data!);
      return resultRefresh;
    }
    return Failure();

  }
}
