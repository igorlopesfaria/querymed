import 'package:commons_core/exceptions/data_exception.dart';
import 'package:commons_core/extensions/exception.dart';
import 'package:commons_crash_report/i_crash_reporter.dart';
import 'package:dio/dio.dart';
import 'package:features_address/data/datasource/api/endpoint/endpoint.dart';
import 'package:features_address/data/datasource/api/i_address_datasource.dart';
import 'package:features_address/data/dto/response/address_state_api_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IAddressApiDataSource)
class AddressApiDataSource implements IAddressApiDataSource{
  final Dio _dio;
  final ICrashReport _reporter;

  AddressApiDataSource(this._dio, this._reporter);

  @override
  Future<List<AddressStateApiResponse>> findAllState() async {
    try{
      final response = await _dio.get(CHECK_ADDRESS_STATE_ENDPOINT);
      if(response.statusCode == 200) {
        final data = response.data as List; // Cast the response data to a list
        return data
            .map((item) => AddressStateApiResponse.fromJson(item)) // Map each item to CrmStateApiResponse
            .toList(); // Convert the iterable to a list
      }
      throw DataApiException();
    } on Exception catch (exception, stacktrace){
      _reporter.recordError(
        exception,
        stackTrace: stacktrace,
        reason: "Unexpected ERROR on GET $CHECK_ADDRESS_STATE_ENDPOINT",
      );
      throw exception.mapToCustomException();
    }
  }
}

