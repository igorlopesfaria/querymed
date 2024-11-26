import 'package:commons_core/exceptions/business_exception.dart';
import 'package:commons_core/result/result.dart';
import 'package:commons_validator/domain/model/fields.dart';
import 'package:injectable/injectable.dart';
import 'package:commons_validator/domain/repository/i_validator_repository.dart';

@Injectable()
class ValidateCrmUseCase {
  final IValidatorRepository repository;
  final RegExp crmPattern = RegExp(r'^\d{1,6}/[A-Z]{2}$'); // Matches up to 6 digits followed by /XX (state)

  ValidateCrmUseCase(this.repository);

  Future<Result> invoke(String crm, bool verifyIsUnique) async {
    if (crm.trim().isEmpty) {
      return Failure(exception: EmptyFieldException());
    }

    if (!crmPattern.hasMatch(crm)) {
      return Failure(exception: InvalidFieldException());
    }

    if (verifyIsUnique) {
      return repository.validateField(crmField, crm);
    } else {
      return Success();
    }
  }
}
