import 'package:features_biometry/domain/repository/i_biometry_repository.dart';
import 'package:commons_core/result/result.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class InsertUseBiometryUseCase {
  final IBiometryRepository repositoryBiometry;

  InsertUseBiometryUseCase(this.repositoryBiometry);

  Future<Result> invoke(bool shouldUseBiometry) async {
    return await repositoryBiometry.insertUseBiometryOnSignin(shouldUseBiometry);
  }
}