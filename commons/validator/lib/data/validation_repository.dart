import 'package:commons_core/exceptions/business_exception.dart';
import 'package:commons_core/exceptions/data_exception.dart';
import 'package:commons_core/result/result.dart';
import 'package:commons_validator/data/datasource/api/i_validator_api_datasrouce.dart';
import 'package:commons_validator/data/datasource/error_code/validator_error_message.dart';
import 'package:commons_validator/domain/repository/i_validator_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IValidatorRepository)
class ValidatorRepository implements IValidatorRepository {
  final IValidatorApiDataSource _apiDataSource;

  ValidatorRepository(this._apiDataSource);

  @override
  Future<Result> validateField(String field, String value) async {
    try {
      await _apiDataSource.validateField(field, value);
      return Success();
    } on DataApiInternetConnectionException {
      return Failure(exception: ConnectionException());
    } on DataApiBadResponseException catch (exception){
      if (exception.errorApiResponse != null) {
        switch (exception.errorApiResponse?.code) {
          case invalidInputCode:
            return Failure(exception: DuplicatedFieldException());
          case duplicatedInputCode:
            return Failure(exception: InvalidFieldException());
        }
      }
      return Failure();
    } catch (e) {
      return Failure();
    }
  }

}
