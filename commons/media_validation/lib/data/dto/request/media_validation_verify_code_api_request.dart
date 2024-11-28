import 'package:equatable/equatable.dart';

class MediaValidationVerifyCodeApiRequest extends Equatable {

  const MediaValidationVerifyCodeApiRequest({
    required this.code,
    required this.token
  });

  final String code;
  final String token;

  Map<String, dynamic> toJson() => {
    'token' : token,
    'code': code
  };

  @override
  List<Object> get props => [code, token];
}



