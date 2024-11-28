
import 'package:commons_core/error_api_response/error_api_response.dart';
import 'package:commons_core/exceptions/data_exception.dart';
import 'package:commons_crash_report/crash_reporter.dart';
import 'package:commons_crash_report/i_crash_reporter.dart';
import 'package:commons_media_validation/data/datasource/api/endpoint/endpoint.dart';
import 'package:commons_media_validation/data/datasource/api/i_media_validation_api_datasource.dart';
import 'package:commons_media_validation/data/dto/request/media_validation_api_request.dart';
import 'package:commons_media_validation/data/dto/request/media_validation_verify_code_api_request.dart';
import 'package:commons_media_validation/data/dto/response/media_validation_api_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: IMediaValidationApiDataSource)
class MediaValidationApiDataSource implements IMediaValidationApiDataSource{
  final Dio _dio;
  final ICrashReport _reporter;

  MediaValidationApiDataSource(this._dio, this._reporter);

  @override
  Future verifyCode(MediaValidationVerifyCodeApiRequest request) async {
    try{
      final response = (await _dio.post("$ENDPOINT_MIDIA_VALIDATIONS/${request.token}",
          data: request.toJson()));
      if(response.statusCode != 200) {
        throw DataApiException();
      }
    } on DioException catch (exception, stacktrace) {
      switch (exception.type) {
        case DioExceptionType.connectionError:
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.unknown:
          throw DataApiInternetConnectionException();
        case DioExceptionType.badResponse:
          _reporter.recordError(exception, stackTrace: stacktrace,
            reason: "Unexpected ERROR on POST $ENDPOINT_MIDIA_VALIDATIONS",
          );
          if (exception.response?.data?.errorData != null) {
            throw DataApiBadResponseException(
                code: ErrorApiResponse.fromJson(
                    exception.response!.data.errorData
                ).code
            );
          }
          throw DataApiException();
        default:
          _reporter.recordError(exception, stackTrace: stacktrace,
              reason: "Unexpected ERROR on POST $ENDPOINT_MIDIA_VALIDATIONS / ${request.token}",
          );
          throw DataApiException();
      }
    }
  }

  @override
  Future<MediaValidationApiResponse> getToken(MediaValidationApiRequest request) async {
    try {
      final response = (await _dio.post(
          ENDPOINT_MIDIA_VALIDATIONS, data: request.toJson()));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return MediaValidationApiResponse.fromJson(response.data);
      }
      throw DataApiException();
    } on DioException catch (exception, stacktrace) {
      switch (exception.type) {
        case DioExceptionType.connectionError:
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.unknown:
          throw DataApiInternetConnectionException();
        case DioExceptionType.badResponse:
          _reporter.recordError(exception, stackTrace: stacktrace,
            reason: "Unexpected ERROR on POST $ENDPOINT_MIDIA_VALIDATIONS",
          );
          if (exception.response?.data?.errorData != null) {
            final error = ErrorApiResponse.fromJson(exception.response!.data.errorData);
            throw DataApiBadResponseException(code: error.code);
          }
          throw DataApiException();
        default:
          _reporter.recordError(exception, stackTrace: stacktrace,
              reason: "Unexpected ERROR on POST $ENDPOINT_MIDIA_VALIDATIONS",
              customInfo: {"resource": request.resource, "media": request.media}
          );
          throw DataApiException();
      }
    }
  }
}
