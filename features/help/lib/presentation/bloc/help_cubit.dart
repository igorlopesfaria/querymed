import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:features_help/domain/usecase/get_help_contact_usecase.dart';
import 'package:features_help/presentation/bloc/help_state.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class HelpCubit extends Cubit<HelpState> {

  HelpCubit({
    required this.getHelpContactUseCase,
  }) : super(HelpInitState());

  final GetHelpContactUseCase getHelpContactUseCase;

  Future getContact() async {
    emit(HelpLoadingState());
    emit(HelpSuccessState(contact: await getHelpContactUseCase.invoke()));
  }
}