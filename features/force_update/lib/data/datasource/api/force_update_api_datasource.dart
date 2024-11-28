import 'package:commons_core/exceptions/data_exception.dart';
import 'package:commons_core/extensions/exception.dart';
import 'package:commons_crash_report/i_crash_reporter.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:features_force_update/data/datasource/api/endpoint/endpoint.dart';
import 'package:features_force_update/data/datasource/api/i_force_update_api_datasource.dart';
import 'package:features_force_update/data/dto/response/force_update_check_version_api_response.dart';

@Injectable(as: IForceUpdateApiDataSource)
class ForceUpdateApiDataSource implements IForceUpdateApiDataSource{
  final Dio _dio;
  final ICrashReport _reporter;

  ForceUpdateApiDataSource(this._dio, this._reporter);

  @override
  Future<ForceUpdateCheckVersionApiResponse> checkForceUpdate(String platform, String versionCode) async {
    try{
      final response = await _dio.get("$CHECK_FORCE_UPDATE_ENDPOINT$platform/$versionCode");
      if(response.statusCode == 200) {
        return ForceUpdateCheckVersionApiResponse.fromJson(response.data);
      }
      throw DataApiException();
    } on Exception catch (exception, stacktrace){
      _reporter.recordError(
        exception,
        stackTrace: stacktrace,
        reason: "Unexpected ERROR on GET $CHECK_FORCE_UPDATE_ENDPOINT$platform/$versionCode",
      );
      throw exception.mapToCustomException();
    }
  }
}

