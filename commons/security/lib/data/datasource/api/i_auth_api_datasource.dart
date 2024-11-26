import 'package:commons_security/data/dto/request/auth_api_request.dart';
import 'package:commons_security/data/dto/request/auth_refresh_token_api_request.dart';
import 'package:commons_security/data/dto/response/auth_api_response.dart';

abstract class IAuthApiDataSource {
  Future<AuthApiResponse> signin(AuthApiRequest request);
  Future<AuthApiResponse> refreshToken(AuthRefreshTokenApiRequest request);
}