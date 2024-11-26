
import 'package:dio/dio.dart';

abstract class IOAuthInterceptor extends QueuedInterceptor {
  @override
  Future<void> onRequest(final RequestOptions options, final RequestInterceptorHandler handler);
  @override
  Future<void> onError(final DioException err, final ErrorInterceptorHandler handler);

}