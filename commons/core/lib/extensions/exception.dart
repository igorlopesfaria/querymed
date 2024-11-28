import 'package:commons_core/error_api_response/error_api_response.dart';
import 'package:commons_core/exceptions/data_exception.dart';
import 'package:dio/dio.dart';

extension ExceptionHandler on Exception {

  Exception mapToCustomException() {
    if (this is DioException) {
      final dioException = this as DioException;
      switch (dioException.type) {
        case DioExceptionType.connectionError:
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.unknown:
          return DataApiInternetConnectionException();
        case DioExceptionType.badResponse:
          if (dioException.response?.statusCode == 401 || dioException.response?.statusCode == 403) {
            return DataApiSeverForbiddenException();
          }
          if (dioException.response?.data?.errorData != null) {
            final error = ErrorApiResponse.fromJson(
                dioException.response!.data.errorData
            );
            return DataApiBadResponseException(code: error.code);
          }

          return DataApiException();
        default:
          return DataApiException();
      }
    } else {
      return DataApiException();
    }
  }

}
