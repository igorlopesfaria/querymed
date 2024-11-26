import 'package:equatable/equatable.dart';

class ForceUpdateCheckVersionApiResponse extends Equatable{
  const ForceUpdateCheckVersionApiResponse({required this.forceUpdate});
  
  final bool forceUpdate;
  
  factory ForceUpdateCheckVersionApiResponse.fromJson(Map<String, dynamic> json) =>
      ForceUpdateCheckVersionApiResponse(forceUpdate: json["force_update"]);

  @override
  List<Object?> get props => [forceUpdate];
}