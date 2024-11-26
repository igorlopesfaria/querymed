import 'package:features_biometry/domain/repository/i_biometry_repository.dart';
import 'package:commons_core/result/result.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class FindUseBiometryUseCase {
  final IBiometryRepository repositoryBiometry;

  FindUseBiometryUseCase(this.repositoryBiometry);

  Future<Result<bool>> invoke() async {
    return await repositoryBiometry.findUseBiometryOnSignin();
  }
}