import 'package:commons_interceptors/interceptors/oauth/extentions/oauth_options.dart';
import 'package:dio/dio.dart';

extension OAuthRequestOptions on RequestOptions {
  bool shouldAuthenticate() => extra['token'] != "" && extra['token'] != null;

  setAuthHeader() =>
      headers['Authorization'] = 'Bearer ${extra['token']}';

  Options setAuthToken(String? token) {
    extra['token'] = token;
    return asOAuthOptions();
  }

  setContentTypeJsonHeader() => headers['Content-Type'] = 'application/json';
}