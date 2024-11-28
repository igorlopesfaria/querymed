import 'package:commons_core/result/result.dart';
import 'package:commons_media_validation/domain/model/media_validation.dart';
import 'package:commons_media_validation/domain/repository/i_media_validation_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class MediaValidationGetTokenUseCase {
  final IMediaValidationRepository _repository;

  MediaValidationGetTokenUseCase(this._repository);

  Future<Result<MediaValidation>> invoke(String resource, media) async {
    return  await _repository.getToken(resource, media);
  }
}
