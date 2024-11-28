
import 'package:commons_core/exceptions/business_exception.dart';
import 'package:commons_core/exceptions/data_exception.dart';
import 'package:commons_core/result/result.dart';
import 'package:commons_security/data/datasource/api/error_code/auth_error_message.dart';
import 'package:commons_security/data/datasource/api/i_auth_api_datasource.dart';
import 'package:commons_security/data/datasource/local/i_auth_local_datasource.dart';
import 'package:commons_security/data/dto/request/auth_api_request.dart';
import 'package:commons_security/data/dto/request/auth_refresh_token_api_request.dart';
import 'package:commons_security/data/mapper/auth_mapper.dart';
import 'package:commons_security/domain/model/auth.dart';
import 'package:commons_security/domain/repository/i_auth_repository.dart';
import 'package:commons_security/provider/i_auth_provider.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IAuthRepository)
class AuthRepository implements IAuthRepository {

  final IAuthLocalDataSource authLocal;
  final IAuthApiDataSource authApi;
  final IAuthProvider authProvider;

  AuthRepository(this.authLocal, this.authApi, this.authProvider);

  @override
  Future<Result> delete() async {
    try {
      authProvider.setLoggedUser(null);
      await authLocal.delete();
      return Success();
    } catch(e) {
      return Failure();
    }
  }

  @override
  Future<Result<Auth>> find() async {
    try {
      final authLocalDB = await authLocal.find();
      if (authLocalDB != null) {
        final auth = authLocalDB.mapLocalToModel;
        authProvider.setLoggedUser(auth);
        return Success(data: auth);
      } else {
        return Success();
      }
    } catch (e) {
      return Failure();
    }
  }

  @override
  Future<Result> save(Auth auth) async {
    authProvider.setLoggedUser(auth);
    try {
      await authLocal.insert(auth.mapModelToLocal);
      return Success();
    } catch (e) {
      return Failure();
    }
  }

  @override
  Future<Result<Auth>> signin(String username, String password) async {
    try {
      final authApiResponse = await authApi.signin(
          AuthApiRequest(username: username, password: password)
      );
      return Success(data: authApiResponse.mapApiToModel);
    } on DataApiInternetConnectionException {
      return Failure(exception: ConnectionException());
    } on DataApiBadResponseException catch (exception){
      return exception.code == badCredentialsCode
          ? Failure(exception: BadCredentialsException())
          : Failure();
    } catch (e) {
      return Failure();
    }
  }

  @override
  Future<Result<Auth>> refreshToken(String refreshToken) async {
    try {
      final authApiResponse = await authApi.refreshToken(
          AuthRefreshTokenApiRequest(stRefreshToken: refreshToken)
      );
      return Success(data: authApiResponse.mapApiToModel);
    } on DataApiInternetConnectionException {
      return Failure(exception: ConnectionException());
    } on DataApiSeverForbiddenException {

      return Failure(exception: BadCredentialsException());
    } catch (e) {
      return Failure();
    }
  }

}
