import 'package:features_biometry/domain/repository/i_biometry_repository.dart';
import 'package:commons_core/result/result.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class FindAskBiometryUseCase {
  final IBiometryRepository repositoryBiometry;

  FindAskBiometryUseCase(this.repositoryBiometry);

  Future<Result> invoke() async {
    return await repositoryBiometry.findAskBiometryOnSignin();
  }
}