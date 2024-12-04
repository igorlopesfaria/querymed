import 'package:features_address/data/dto/response/address_state_api_response.dart';

abstract class IAddressApiDataSource{
  Future<List<AddressStateApiResponse>> findAllState();
}
