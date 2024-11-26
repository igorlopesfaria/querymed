import 'package:commons_core/exceptions/business_exception.dart';
import 'package:injectable/injectable.dart';
import 'package:commons_core/result/result.dart';
import 'package:commons_validator/domain/repository/i_validator_repository.dart';

@injectable
class ValidatePasswordUseCase {
  ValidatePasswordUseCase(this.repository);
  final minLength = 8;
  final hasLowerCase = RegExp(r'[a-z]');
  final hasNumber = RegExp(r'\d');

  final IValidatorRepository repository;

  Future<Result> invoke(String password ) async {
    if (password.trim().isEmpty) {
      return Failure(exception: EmptyFieldException());
    }

    if (!(password.length >= minLength && hasLowerCase.hasMatch(password) && hasNumber.hasMatch(password))) {
      return Failure(exception: InvalidFieldException());
    }

    return Success();
  }
}
