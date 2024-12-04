import 'package:commons_core/result/result.dart';
import 'package:features_address/data/datasource/api/i_address_datasource.dart';
import 'package:features_address/data/mapper/address_state_mapper.dart';
import 'package:features_address/domain/model/address_state.dart';
import 'package:features_address/domain/repository/i_address_state_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IAddressRepository)
class AddressRepository implements IAddressRepository{
  AddressRepository(this._apiDataSource);

  final IAddressApiDataSource _apiDataSource;

  @override
  Future<Result<List<AddressState>>> findAllState() async{
    try {
      final listCrmState = (await _apiDataSource.findAllState()).map(
              (it) => it.mapApiToModel
      ).toList();
      return Success(data: listCrmState);
    } catch (exception) {
      return Failure();
    }
  }

}
