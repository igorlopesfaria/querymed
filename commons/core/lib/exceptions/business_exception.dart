class InvalidFieldException implements Exception {
  String? cause;
  InvalidFieldException({this.cause});
}

class NotMatchFieldException implements Exception {
  String? cause;
  NotMatchFieldException({this.cause});
}

class ConnectionException implements Exception {
  String? cause;
  ConnectionException({this.cause});
}

class DuplicatedFieldException implements Exception {
  String? cause;
  DuplicatedFieldException({this.cause});
}

class EmptyFieldException implements Exception {
  String? cause;
  EmptyFieldException({this.cause});
}

class BadCredentialsException implements Exception {
  String? cause;
  BadCredentialsException({this.cause});
}

class GenericException implements Exception {
  String? cause;
  GenericException({this.cause});
}

class UnauthorizedException implements Exception {
  String? cause;
  UnauthorizedException({this.cause});
}

class RequestedTooManyTimeException implements Exception {
  String? cause;
  RequestedTooManyTimeException({this.cause});
}



