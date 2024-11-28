import 'package:commons_media_validation/data/dto/request/media_validation_api_request.dart';
import 'package:commons_media_validation/data/dto/request/media_validation_verify_code_api_request.dart';
import 'package:commons_media_validation/data/dto/response/media_validation_api_response.dart';

abstract class IMediaValidationApiDataSource{
  Future<MediaValidationApiResponse> getToken(MediaValidationApiRequest request);

  Future verifyCode(MediaValidationVerifyCodeApiRequest request);
}