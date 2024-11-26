import 'package:equatable/equatable.dart';

class HelpContact extends Equatable {
  const HelpContact({
    required this.whatsappNumber,
    required this.whatsappNumberFormatted,
    required this.email
  });

  final String whatsappNumber;
  final String whatsappNumberFormatted;
  final String email;

  @override
  List<Object> get props => [whatsappNumber, whatsappNumberFormatted, email];
}