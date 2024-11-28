import 'package:commons_core/result/result.dart';
import 'package:features_reset_password/domain/repository/i_reset_password_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UpdatePasswordUseCase {
  final IResetPasswordRepository _repository;

  UpdatePasswordUseCase(this._repository);

  Future<Result> invoke(String password, token) async {
    return  await _repository.updatePassword(password, token);
  }
}
