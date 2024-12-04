import 'package:features_address/di/address_module.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(initializerName: 'initFeaturesAddressGetIt')
Future<void> configureFeaturesAddressDependencies(GetIt getIt) async =>
    getIt.initFeaturesAddressGetIt();
