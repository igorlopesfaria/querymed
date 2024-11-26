import 'package:dio/dio.dart';

abstract class ILoggerInterceptor extends QueuedInterceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler);
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler);
}
