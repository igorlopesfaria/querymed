import 'package:commons_core/exceptions/business_exception.dart';
import 'package:commons_core/exceptions/data_exception.dart';
import 'package:commons_core/result/result.dart';
import 'package:features_reset_password/data/datasource/api/error_code/error_code.dart';
import 'package:features_reset_password/data/datasource/api/i_reset_password_api_datasource.dart';
import 'package:features_reset_password/data/datasource/dto/request/reset_password_api_request.dart';
import 'package:features_reset_password/domain/repository/i_reset_password_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IResetPasswordRepository)
class ResetPasswordRepository implements IResetPasswordRepository {
  final IResetPasswordApiDataSource _apiDataSource;

  ResetPasswordRepository(this._apiDataSource);

  @override
  Future<Result> updatePassword(String password, String token) async {
    try {
      await _apiDataSource.updatePassword(
        ResetPasswordApiRequest(newPassword: password, token: token)
      );
      return Success();
    } on DataApiInternetConnectionException {
      return Failure(exception: ConnectionException());
    } on DataApiBadResponseException catch (exception) {
      return exception.code == invalidToken
          ? Failure(exception: InvalidFieldException())
          : Failure();
    } catch (e) {
      return Failure();
    }
  }
}