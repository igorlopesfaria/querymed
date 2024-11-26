import 'package:commons_security/data/dto/db/auth_local_db.dart';
import 'package:commons_security/data/dto/response/auth_api_response.dart';
import 'package:commons_security/domain/model/auth.dart';

extension AuthApiResponseMapper on AuthApiResponse {
  Auth get mapApiToModel {
    return Auth(
        id: id,
        token: token.mapApiToModel
    );
  }
}

extension AuthTokenApiResponseMapper on AuthTokenApiResponse {
  AuthToken get mapApiToModel {
    return AuthToken(
        stAccessToken: stAccessToken,
        stRefreshToken: stRefreshToken
    );
  }
}

extension AuthLocalMapper on AuthLocalDB {
  Auth get mapLocalToModel {
    return Auth(
        id: id,
        token: token.mapLocalToModel
    );
  }
}

extension AuthTokenLocalMapper on AuthTokenLocalDB {
  AuthToken get mapLocalToModel {
    return AuthToken(
        stAccessToken: stAccessToken,
        stRefreshToken: stRefreshToken
    );
  }
}

extension AuthMapper on Auth {
  AuthLocalDB get mapModelToLocal {
    return AuthLocalDB(id: id, token: token.mapModelToLocal);
  }
}

extension AuthTokenMapper on AuthToken {
  AuthTokenLocalDB get mapModelToLocal {
    return AuthTokenLocalDB(
        stAccessToken: stAccessToken,
        stRefreshToken: stRefreshToken
    );
  }
}
