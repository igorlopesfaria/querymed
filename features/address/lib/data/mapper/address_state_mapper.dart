
import 'package:features_address/data/dto/response/address_state_api_response.dart';
import 'package:features_address/domain/model/address_state.dart';

extension AddressStateApiResponseMapper on AddressStateApiResponse {
  AddressState get mapApiToModel {
    return AddressState(
        stateCode: stateCode,
        stateName: stateName,
        flagImagePath: flagImagePath
    );
  }
}
