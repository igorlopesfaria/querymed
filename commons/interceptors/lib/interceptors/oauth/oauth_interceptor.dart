import 'package:commons_interceptors/interceptors/oauth/extentions/oauth_request_options.dart';
import 'package:commons_interceptors/interceptors/oauth/i_oauth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IOAuthInterceptor)
class OAuthInterceptor extends IOAuthInterceptor{

  @override
  Future<void> onRequest(final RequestOptions options,
      final RequestInterceptorHandler handler) async {
    options.setContentTypeJsonHeader();

    if(options.shouldAuthenticate()){
      options.setAuthHeader();
    }
    return handler.next(options);
  }

  @override
  Future<void> onError(
      final DioException err, final ErrorInterceptorHandler handler) async {

    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      // refresh token
    }
    return super.onError(err, handler);
  }
}




