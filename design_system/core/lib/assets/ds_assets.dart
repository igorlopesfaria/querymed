import 'package:design_system_core/assets/assets_base.dart';

class DSAssets implements AssetsBase {
  final String _path = "packages/design_system_core/assets";


  @override
  String get icWhatsapp => "$_path/icons/ic_whatsapp.png";

  @override
  String get icFaq => "$_path/icons/ic_faq.png";

  @override
  String get imTutorial1 => "$_path/images/im_tutorial_1.png";

  @override
  String get imTutorial2 => "$_path/images/im_tutorial_2.png";

  @override
  String get imTutorial3 => "$_path/images/im_tutorial_3.png";

  @override
  String get imRocket => "$_path/images/im_rocket.png";

  @override
  String get imHelp => "$_path/images/im_help.png";

  @override
  String get imForceUpdate => "$_path/images/im_force_update.png";

  @override
  String get imFatalError => "$_path/images/im_fatal_error.png";

  @override
  String get imConnectionError => "$_path/images/im_connection_error.png";

  @override
  String get imLogoFull => "$_path/images/im_logo_full.png";

  @override
  String get imLogo => "$_path/images/im_logo.png";

  @override
  String get animForceUpdate => "$_path/animation/force_update.lottie";

  @override
  String get animHelp => "$_path/animation/help.lottie";

  @override
  String get animBiometry => "$_path/animation/biometry.lottie";

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
