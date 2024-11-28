import 'package:commons_media_validation/data/dto/response/media_validation_api_response.dart';
import 'package:commons_media_validation/domain/model/media_validation.dart';

extension MediaValidationApiResponseMapper on MediaValidationApiResponse {
  MediaValidation get mapApiToModel {
    return MediaValidation(
        resource: resource,
        media: media,
        token: token
    );
  }
}
