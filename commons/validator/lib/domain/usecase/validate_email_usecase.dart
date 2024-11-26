import 'package:commons_core/exceptions/business_exception.dart';
import 'package:commons_core/result/result.dart';
import 'package:injectable/injectable.dart';
import 'package:commons_validator/domain/model/fields.dart';
import 'package:commons_validator/domain/repository/i_validator_repository.dart';

@Injectable()
class ValidateEmailUseCase {
  final IValidatorRepository _repository;
  final RegExp emailPattern = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  ValidateEmailUseCase(this._repository);

  Future<Result> invoke(String email, bool verifyIsUnique) async {
    if (email.trim().isEmpty) {
      return Failure(exception: EmptyFieldException());
    }

    if (!emailPattern.hasMatch(email)) {
      return Failure(exception: InvalidFieldException());
    }

    if(verifyIsUnique) {
      return _repository.validateField(emailField, email);
    } else {
      return Success();
    }

  }
}
