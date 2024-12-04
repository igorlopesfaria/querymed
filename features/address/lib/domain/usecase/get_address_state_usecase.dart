import 'package:commons_core/result/result.dart';
import 'package:features_address/domain/model/address_state.dart';
import 'package:features_address/domain/repository/i_address_state_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetAddressStateUseCase{

  GetAddressStateUseCase(this._repository);

  final IAddressRepository _repository;

  Future<Result<List<AddressState>>> invoke() async => _repository.findAllState();
}