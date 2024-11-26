import 'package:commons_core/result/result.dart';
import 'package:commons_security/domain/model/auth.dart';
import 'package:commons_security/domain/repository/i_auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AuthFindCredentialsUseCase{
  final IAuthRepository _repository;

  AuthFindCredentialsUseCase(this._repository);

  Future<Result<Auth>> invoke() async => await _repository.find();
}