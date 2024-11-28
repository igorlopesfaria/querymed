import 'package:commons_core/error_api_response/error_api_response.dart';
import 'package:commons_core/exceptions/data_exception.dart';
import 'package:commons_core/extensions/exception.dart';
import 'package:commons_crash_report/i_crash_reporter.dart';
import 'package:commons_security/data/datasource/api/i_auth_api_datasource.dart';
import 'package:commons_security/data/datasource/api/endpoint/endpoint.dart';
import 'package:commons_security/data/dto/request/auth_api_request.dart';
import 'package:commons_security/data/dto/request/auth_refresh_token_api_request.dart';
import 'package:commons_security/data/dto/response/auth_api_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: IAuthApiDataSource)
class AuthApiDataSource implements IAuthApiDataSource {
  final Dio _dio;
  final ICrashReport _reporter;

  AuthApiDataSource(this._dio, this._reporter);

  @override
  Future<AuthApiResponse> signin(AuthApiRequest request) async {
    try {
      final response = await _dio.post(ENDPOINT_SIGNIN, data: request.toJson());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AuthApiResponse.fromJson(response.data);
      }

      throw DataApiException();
    } on Exception catch (exception, stacktrace){
      _reporter.recordError(
        exception,
        stackTrace: stacktrace,
        reason: "Unexpected ERROR on POST $ENDPOINT_REFRESH_TOKEN",
      );
      throw exception.mapToCustomException();
    }
  }

  @override
  Future<AuthApiResponse> refreshToken(AuthRefreshTokenApiRequest request) async {
    try {
      final response = await _dio.post(ENDPOINT_REFRESH_TOKEN, data: request.toJson());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AuthApiResponse.fromJson(response.data);
      }

      throw DataApiException();
    } on Exception catch (exception, stacktrace){
      _reporter.recordError(
        exception,
        stackTrace: stacktrace,
        reason: "Unexpected ERROR on POST $ENDPOINT_REFRESH_TOKEN",
      );
      throw exception.mapToCustomException();
    }
  }

}
