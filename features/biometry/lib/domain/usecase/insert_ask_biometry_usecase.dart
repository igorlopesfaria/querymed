import 'package:features_biometry/domain/repository/i_biometry_repository.dart';
import 'package:commons_core/result/result.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class InsertAskBiometryUseCase {
  final IBiometryRepository repositoryBiometry;

  InsertAskBiometryUseCase(this.repositoryBiometry);

  Future<Result> invoke(bool shouldAskBiometry) async {
    return await repositoryBiometry.insertAskBiometryOnSignin(shouldAskBiometry);
  }
}