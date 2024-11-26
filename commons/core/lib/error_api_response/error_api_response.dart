import 'package:equatable/equatable.dart';

class ErrorApiResponse extends Equatable {
  const ErrorApiResponse({
    required this.message,
    required this.code,
  });

  final String message;
  final int code;

  factory ErrorApiResponse.fromJson(Map<String, dynamic> json) =>
      ErrorApiResponse(
          message: json["message"],
          code: json["code"]);

  @override
  List<Object> get props => [message, code];
}

