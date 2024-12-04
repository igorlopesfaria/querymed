import 'package:commons_remote_config/data/key/remote_config_key.dart';
import 'package:commons_remote_config/domain/repository/i_remote_config_repository.dart';
import 'package:features_help/domain/model/help_contact.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetHelpContactUseCase{

  final IRemoteConfigRepository repository;

  GetHelpContactUseCase(this.repository);

  Future<HelpContact> invoke() async => HelpContact(
    whatsappNumber: repository.getString(RemoteConfigKeys.helpWhatsappNumber),
    whatsappNumberFormatted: repository.getString(RemoteConfigKeys.helpWhatsappNumberFormatted),
    email: repository.getString(RemoteConfigKeys.helpEmail)
  );
}