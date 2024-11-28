
import 'package:commons_core/result/result.dart';
import 'package:commons_media_validation/domain/repository/i_media_validation_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class MediaValidationVerifyCodeUseCase {
  final IMediaValidationRepository _repository;

  MediaValidationVerifyCodeUseCase(this._repository);

  Future<Result> invoke(String code, token) async {
    return  await _repository.verifyCode(code, token);
  }
}
