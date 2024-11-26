import 'package:commons_core/error_api_response/error_api_response.dart';

class DataApiException implements Exception {
  String? cause;
  DataApiException({this.cause});
}

class DataDBException implements Exception {
  String? cause;
  DataDBException({this.cause});
}


class DataApiBadResponseException implements Exception {
  String? cause;
  ErrorApiResponse? errorApiResponse;
  DataApiBadResponseException({this.cause, this.errorApiResponse});
}

class DataApiInternetConnectionException implements Exception {
  String? cause;
  DataApiInternetConnectionException({this.cause});
}

class DataApiSeverForbiddenException implements Exception {
  String? cause;
  DataApiSeverForbiddenException({this.cause});
}

