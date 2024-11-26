import 'package:commons_core/exceptions/business_exception.dart';
import 'package:commons_core/extensions/string.dart';
import 'package:commons_core/result/result.dart';
import 'package:injectable/injectable.dart';
import 'package:commons_validator/domain/model/fields.dart';
import 'package:commons_validator/domain/repository/i_validator_repository.dart';

@Injectable()
class ValidatePhoneUseCase {
  ValidatePhoneUseCase(this.repository);

  final IValidatorRepository repository;
  final phonePattern = RegExp(r'^\(\d{2}\) \d{4}-\d{4}$|^\d{2} \d{4}-\d{4}$|^\d{11}$');

  Future<Result> invoke(String phone, bool verifyIsUnique) async {
    if (phone.isEmpty) {
      return Failure(exception: EmptyFieldException());
    }

    String phoneWithoutFormat = phone.removePhoneFormat;
    if (!phonePattern.hasMatch(phoneWithoutFormat)) {
      return Failure(exception: InvalidFieldException());
    }

    if(verifyIsUnique) {
      return repository.validateField(phoneField, phoneWithoutFormat);
    } else {
      return Success();
    }
  }
}
