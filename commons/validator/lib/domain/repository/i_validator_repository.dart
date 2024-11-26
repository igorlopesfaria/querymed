import 'package:commons_core/result/result.dart';

abstract class IValidatorRepository {
  Future<Result> validateField(String field, String value);
}
