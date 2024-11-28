class DataApiException implements Exception {
  String? cause;
  DataApiException({this.cause});
}

class DataDBException implements Exception {
  String? cause;
  DataDBException({this.cause});
}

class DataApiBadResponseException implements Exception {
  int? code;
  DataApiBadResponseException({this.code});
}

class DataApiInternetConnectionException implements Exception {
  String? cause;
  DataApiInternetConnectionException({this.cause});
}

class DataApiSeverForbiddenException implements Exception {
  String? cause;
  DataApiSeverForbiddenException({this.cause});
}

