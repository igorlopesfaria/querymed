import 'package:commons_core/exceptions/business_exception.dart';
import 'package:commons_core/result/result.dart';
import 'package:commons_validator/domain/model/fields.dart';
import 'package:injectable/injectable.dart';
import 'package:commons_validator/domain/repository/i_validator_repository.dart';

@Injectable()
class ValidateCrmUseCase {
  final IValidatorRepository repository;

  // Matches 5-6 digits followed by /XX (state)
  final RegExp crmPattern = RegExp(r'^\d{5,6}/[A-Z]{2}$');

  ValidateCrmUseCase(this.repository);

  Future<Result> invoke(String crm, bool verifyIsUnique) async {
    // Trim input to remove leading or trailing whitespace
    final trimmedCrm = crm.trim();

    // Check for empty CRM
    if (trimmedCrm.isEmpty) {
      return Failure(exception: EmptyFieldException());
    }

    // Check for invalid CRM format
    if (!crmPattern.hasMatch(trimmedCrm)) {
      return Failure(exception: InvalidFieldException());
    }

    // Verify uniqueness if required
    if (verifyIsUnique) {
      return repository.validateField(crmField, trimmedCrm);
    }

    return Success();
  }
}
