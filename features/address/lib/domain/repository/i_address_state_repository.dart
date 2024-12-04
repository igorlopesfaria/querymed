import 'package:commons_core/result/result.dart';
import 'package:features_address/domain/model/address_state.dart';

abstract class IAddressRepository {
  Future<Result<List<AddressState>>> findAllState();
}
