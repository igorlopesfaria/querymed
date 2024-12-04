
import 'package:equatable/equatable.dart';

class AddressStateApiResponse extends Equatable{
  const AddressStateApiResponse({
    required this.stateName,
    required this.stateCode,
    required this.flagImagePath
  });

  final String stateName;
  final String stateCode;
  final String flagImagePath;

  factory AddressStateApiResponse.fromJson(Map<String, dynamic> json) =>
      AddressStateApiResponse(
          stateName: json["stateName"],
          stateCode: json["stateCode"],
          flagImagePath: json["flagImagePath"]
      );

  @override
  @override
  List<Object> get props => [stateName, stateCode, flagImagePath];
}