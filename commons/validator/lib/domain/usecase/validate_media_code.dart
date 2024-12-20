import 'package:commons_core/exceptions/business_exception.dart';
import 'package:commons_core/result/result.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ValidateMediaCodeUseCase {


  ValidateMediaCodeUseCase();

  Future<Result> invoke(String code) async {
    final trimmedCode = code.trim();

    if (trimmedCode.isEmpty || trimmedCode.length < 4) {
      return Failure(exception: InvalidFieldException());
    }

    return Success();
  }
}

