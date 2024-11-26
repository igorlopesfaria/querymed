import 'dart:convert';
import 'dart:developer';
import 'package:commons_interceptors/interceptors/logger/i_logger_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ILoggerInterceptor)
class LoggerInterceptor extends ILoggerInterceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';

    log('................Log the error request and error message.................');
    log('<-- RESPONSE CODE ${err.response?.statusCode} - RESPONSE METHOD [${options.method}] $requestPath\n'
          'HEADERS: ${err.response?.headers}\n'
          'BODY: ${(err.response?.data)}',
    ); // L
    return super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';

    log('..................Log request details.....................................');
    log(
      'REQUEST METHOD [${options.method}] $requestPath\n'
          'HEADERS: ${options.headers}\n'
          'BODY: ${_prettyJsonEncode(options.data)}',
    );

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Log the response status code and data
    log(
      'RESPONSE CODE ${response.statusCode} - RESPONSE METHOD [${response.requestOptions.method}]  - RESPONSE URL ${response.requestOptions.baseUrl + response.requestOptions.path }\n'
          'BODY: ${_prettyJsonEncode(response.data)}',
    ); // Log formatted request data
    log('......................Log formatted request data.............................');

    // Call the super class to continue handling the response
    return super.onResponse(response, handler);
  }

  // Helper method to convert data to pretty JSON format
  String _prettyJsonEncode(dynamic data) {
    try {
      const encoder = JsonEncoder.withIndent(null);
      final jsonString = encoder.convert(data);
      return jsonString;
    } catch (e) {
      return data.toString();
    }
  }
}
