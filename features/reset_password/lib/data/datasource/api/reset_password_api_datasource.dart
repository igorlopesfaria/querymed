import 'package:commons_core/exceptions/data_exception.dart';
import 'package:commons_core/extensions/exception.dart';
import 'package:commons_crash_report/crash_reporter.dart';
import 'package:commons_crash_report/i_crash_reporter.dart';
import 'package:dio/dio.dart';
import 'package:features_reset_password/data/datasource/api/endpoint/endpoint.dart';
import 'package:features_reset_password/data/datasource/api/i_reset_password_api_datasource.dart';
import 'package:features_reset_password/data/datasource/dto/request/reset_password_api_request.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: IResetPasswordApiDataSource)
class ResetPasswordApiDataSource implements IResetPasswordApiDataSource {
  final Dio _dio;
  final ICrashReport _reporter;

  ResetPasswordApiDataSource(this._dio, this._reporter);

  @override
  Future updatePassword(ResetPasswordApiRequest request) async {
    try {
      final response = await _dio.put(ENDPOINT_RESET_PASSWORD, data: request.toJson());
      if (response.statusCode != 200) {
        throw DataApiException();
      }
    } on Exception catch (exception, stacktrace) {
      _reporter.recordError(
        exception,
        stackTrace: stacktrace,
        reason: "Unexpected ERROR on PUT $ENDPOINT_RESET_PASSWORD",
      );
      throw exception.mapToCustomException();
    }
  }
}