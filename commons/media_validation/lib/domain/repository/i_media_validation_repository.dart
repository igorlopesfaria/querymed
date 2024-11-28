import 'package:commons_core/result/result.dart';
import 'package:commons_media_validation/domain/model/media_validation.dart';

abstract class IMediaValidationRepository {
  Future<Result<MediaValidation>> getToken(String resource, media);

  Future<Result> verifyCode(String code, String token);

}