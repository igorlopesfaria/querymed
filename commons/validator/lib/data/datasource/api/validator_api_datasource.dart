import 'package:commons_core/exceptions/data_exception.dart';
import 'package:commons_core/extensions/exception.dart';
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
          "$ENDPOINT_VALIDATION?$fieldName=${Uri.encodeComponent(value)}"
      );
      if (response.statusCode != 200) {
        throw DataApiException();
      }
    } on Exception catch (exception, stacktrace){
      _reporter.recordError(
        exception,
        stackTrace: stacktrace,
        reason: "$ENDPOINT_VALIDATION?$fieldName=${Uri.encodeComponent(value)}",
      );
      throw exception.mapToCustomException();
    }
  }
}
