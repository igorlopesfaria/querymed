import 'package:commons_core/error_api_response/error_api_response.dart';
import 'package:commons_core/exceptions/data_exception.dart';
import 'package:commons_crash_report/i_crash_reporter.dart';
import 'package:commons_validator/data/datasource/api/i_validator_api_datasrouce.dart';
import 'package:commons_validator/data/datasource/endpoint/endpoint.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: IValidatorApiDataSource)
class ValidatorApiDataSource implements IValidatorApiDataSource {
  final Dio _dio;
  final ICrashReport _reporter;

  ValidatorApiDataSource(this._dio, this._reporter);

  @override
  Future<void> validateField(
      String fieldName, String value) async {
    try {
      final response = await _dio.get(
          "$ENDPOINT_VALIDATION?$fieldName=${Uri.encodeComponent(value)}");

      if (response.statusCode != 200) {
        throw DataApiException(cause: 'Unexpected status code: ${response.statusCode}');
      }

      return;

    } on DioException catch (exception, stacktrace) {
      switch (exception.type) {
        case DioExceptionType.connectionError:
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.unknown:
          throw DataApiInternetConnectionException();
        case DioExceptionType.badResponse:
          final errorData = exception.response?.data;
          if (errorData != null) {
            throw DataApiBadResponseException(
                errorApiResponse: ErrorApiResponse.fromJson(errorData)
            );
          }
          _reporter.recordError(exception, stackTrace: stacktrace,
              reason: "Unexpected ERROR on GET $ENDPOINT_VALIDATION",
              customInfo: {"fieldName": fieldName, "value" : value }
          );
          throw DataApiException(cause: 'Bad response error: ${exception.response?.statusCode}');
        default:
          _reporter.recordError(exception, stackTrace: stacktrace,
              reason: "Unexpected ERROR on GET $ENDPOINT_VALIDATION",
              customInfo: {"fieldName": fieldName, "value" : value }
          );
          throw DataApiException(cause: 'Unexpected Dio error type: ${exception.type}');
      }
    }
  }
}
