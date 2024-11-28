import 'package:commons_core/result/result.dart';

abstract class IResetPasswordRepository{
  Future<Result> updatePassword(String password, String token);
}