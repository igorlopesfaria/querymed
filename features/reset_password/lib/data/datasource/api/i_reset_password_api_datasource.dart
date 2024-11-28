
import 'package:features_reset_password/data/datasource/dto/request/reset_password_api_request.dart';

abstract class IResetPasswordApiDataSource {
  Future updatePassword(ResetPasswordApiRequest request);
}