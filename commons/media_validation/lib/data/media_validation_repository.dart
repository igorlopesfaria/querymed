import 'package:commons_core/exceptions/business_exception.dart';
import 'package:commons_core/exceptions/data_exception.dart';
import 'package:commons_core/result/result.dart';
import 'package:commons_media_validation/data/datasource/api/error_code/error_code.dart';
import 'package:commons_media_validation/data/datasource/api/i_media_validation_api_datasource.dart';
import 'package:commons_media_validation/data/dto/request/media_validation_api_request.dart';
import 'package:commons_media_validation/data/dto/request/media_validation_verify_code_api_request.dart';
import 'package:commons_media_validation/data/mapper/media_validation_mapper.dart';
import 'package:commons_media_validation/domain/model/media_validation.dart';
import 'package:commons_media_validation/domain/repository/i_media_validation_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IMediaValidationRepository)
class MediaValidationRepository implements IMediaValidationRepository{
  final IMediaValidationApiDataSource _apiDataSource;

  MediaValidationRepository(this._apiDataSource);

  @override
  Future<Result> verifyCode(String code, String token) async {
    try {
      await _apiDataSource.verifyCode(
          MediaValidationVerifyCodeApiRequest(code: code, token: token)
      );
      return Success();
    } on DataApiInternetConnectionException {
      return Failure(exception: ConnectionException());
    } on DataApiBadResponseException catch (exception) {
      return exception.code == invalidCode
          ? Failure(exception: NotMatchFieldException())
          : Failure();
    } catch (e) {
      return Failure();
    }
  }

  @override
  Future<Result<MediaValidation>> getToken(String resource, media) async {
    try {
      final responseApi = await _apiDataSource.getToken(
        MediaValidationApiRequest(resource: media, media: media),
      );
      return Success(data: responseApi.mapApiToModel);
    } on DataApiInternetConnectionException {
      return Failure(exception: ConnectionException());
    }  on DataApiBadResponseException catch (exception){
      return exception.code == waitTimeCode
          ? Failure(exception: RequestedTooManyTimeException())
          : Failure();
    } catch (e) {
      return Failure();
    }
  }

}